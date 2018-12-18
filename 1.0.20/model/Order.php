<?php

namespace addons\cms\model;

use addons\cms\library\OrderException;
use addons\epay\library\Service;
use app\common\library\Auth;
use app\common\model\User;
use think\Exception;
use think\Model;
use think\Request;

/**
 * 订单模型
 */
class Order Extends Model
{

    protected $name = "cms_order";
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
    ];
    protected static $config = [];

    protected static function init()
    {
        $config = get_addon_config('cms');
        self::$config = $config;
    }

    /**
     * 获取查询条件
     * @return \Closure
     */
    protected static function getQueryCondition()
    {
        $condition = function ($query) {

            $auth = Auth::instance();
            $user_id = $auth->isLogin() ? $auth->id : 0;
            $ip = Request::instance()->ip();

            if ($user_id) {
                $query->whereOr('user_id', $user_id)->whereOr('ip', $ip);
            } else {
                $query->where('user_id', 0)->where('ip', $ip);
                //$query->where('ip', $ip);
            }

        };
        return $condition;
    }

    /**
     * 检查订单
     * @param $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function checkOrder($id)
    {
        $archives = Archives::get($id);
        if (!$archives) {
            return false;
        }
        $where = [
            'archives_id' => $id,
            'status'      => 'paid',
        ];

        //匹配已支付订单
        $order = self::where($where)->where(self::getQueryCondition())->order('id', 'desc')->find();
        return $order ? true : false;
    }

    /**
     * 发起订单支付
     * @param $id
     * @param string $paytype
     * @throws Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function submitOrder($id, $paytype = 'wechat')
    {
        $archives = Archives::get($id);
        if (!$archives) {
            throw new OrderException('文档未找到');
        }
        $order = Order::where('archives_id', $archives['id'])
            ->where(self::getQueryCondition())
            ->order('id', 'desc')
            ->find();
        if ($order && $order['status'] == 'paid') {
            throw new OrderException('订单已支付');
        }
        $auth = Auth::instance();
        $request = \think\Request::instance();
        if (!$order) {
            $data = [
                'user_id'     => $auth->id ? $auth->id : 0,
                'archives_id' => $archives->id,
                'title'       => $archives->title,
                'amount'      => $archives->price,
                'payamount'   => 0,
                'paytype'     => $paytype,
                'ip'          => $request->ip(),
                'useragent'   => $request->server('HTTP_USER_AGENT'),
                'status'      => 'created'
            ];
            $order = Order::create($data);
        } else {
            if ($order->amount != $archives->price) {
                $order->amount = $archives->price;
                $order->save();
            }
        }
        //使用余额支付
        if ($paytype == 'balance') {
            if (!$auth->id) {
                throw new OrderException('需要登录后才能够支付');
            }
            if ($auth->money < $archives->price) {
                throw new OrderException('余额不足，无法进行支付');
            }
            \think\Db::startTrans();
            try {
                User::money(-$archives->price, $auth->id, '购买付费文档:' . $archives['title']);
                self::settle($order->id);
                \think\Db::commit();
            } catch (Exception $e) {
                \think\Db::rollback();
                throw new OrderException($e->getMessage());
            }
            throw new OrderException('余额支付成功', 1);
        }

        //使用个人或企业支付
        $pay = get_addon_info('pay');
        $epay = get_addon_info('epay');
        if ($pay && $pay['state']) {
            $notifyurl = $request->root(true) . '/addons/cms/order/pay/type/notify/paytype/' . $paytype;
            $returnurl = $request->root(true) . '/addons/cms/order/pay/type/return/paytype/' . $paytype;

            \addons\pay\library\Service::submitOrder($order['amount'], $order['id'], $paytype, 0, $notifyurl, $returnurl);
        } else if ($epay && $epay['state']) {
            $notifyurl = $request->root(true) . '/addons/cms/order/epay/type/notify/paytype/' . $paytype;
            $returnurl = $request->root(true) . '/addons/cms/order/epay/type/return/paytype/' . $paytype;

            $config = [
                'notify_url' => $notifyurl,
                'return_url' => $returnurl
            ];
            //创建支付对象
            $pay = Service::createPay($paytype, $config);

            if ($paytype == 'alipay') {
                //支付宝支付,请根据你的需求,仅选择你所需要的即可
                $order = [
                    'out_trade_no' => $order->id,//你的订单号
                    'total_amount' => $order->amount,//单位元
                    'subject'      => $archives->title,
                ];

                $pay->web($order)->send();
            } else {
                //微信支付,请根据你的需求,仅选择你所需要的即可
                $order = [
                    'out_trade_no' => $order->id,//你的订单号
                    'body'         => $archives->title,
                    'total_fee'    => $order->amount * 100, //单位分
                ];

                $pay->wap($order)->send();
            }
        } else {
            $result = \think\Hook::listen('cms_order_submit', $order);
            if (!$result) {
                throw new OrderException("请先在后台安装配置个人支付或企业支付");
            }
        }
    }

    /**
     * 订单结算
     * @param $id
     * @param null $payamount
     * @param string $memo
     * @return bool
     * @throws \think\exception\DbException
     */
    public static function settle($id, $payamount = null, $memo = '')
    {
        $order = Order::get($id);
        if (!$order) {
            return false;
        }
        if ($order['status'] != 'paid') {
            $order->payamount = $payamount ? $payamount : $order->amount;
            $order->paytime = time();
            $order->status = 'paid';
            $order->memo = $memo;
            $order->save();
        }
        return true;
    }

    public function archives()
    {
        return $this->belongsTo('Archives', 'archives_id', 'id');
    }

}
