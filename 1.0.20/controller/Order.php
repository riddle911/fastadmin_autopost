<?php

namespace addons\cms\controller;

use addons\cms\library\OrderException;
use addons\cms\model\Archives;
use think\Exception;

/**
 * 订单控制器
 * Class Order
 * @package addons\cms\controller
 */
class Order extends Base
{

    public function _initialize()
    {
        return parent::_initialize();
    }

    /**
     * 创建订单并发起支付请求
     * @throws \think\exception\DbException
     */
    public function submit()
    {
        if (!$this->auth->isLogin()) {
            //这里可以控制是否登录后才可以创建订单
            //$this->error("请登录后再进行操作!");
        }
        $id = $this->request->request('id');
        $paytype = $this->request->request('paytype');
        $archives = Archives::get($id);
        if (!$archives || ($archives['user_id'] != $this->auth->id && $archives['status'] != 'normal') || $archives['deletetime']) {
            $this->error('未找到指的文档');
        }
        try {
            \addons\cms\model\Order::submitOrder($id, $paytype ? $paytype : 'wechat');
        } catch (OrderException $e) {
            if ($e->getCode() == 1) {
                $this->success($e->getMessage(), $archives->url);
            } else {
                $this->error($e->getMessage());
            }
        } catch (Exception $e) {
            $this->error($e->getMessage());
        }
        return;
    }

    /**
     * 个人免签支付通知和回调
     */
    public function pay()
    {
        $type = $this->request->param('type');
        $config = get_addon_config('pay');
        if ($type == 'notify') {
            $order_id = $this->request->request('order_id', '');
            $out_order_id = $this->request->request('out_order_id', '');
            $price = $this->request->request('price', '');
            $realprice = $this->request->request('realprice', '');
            $type = $this->request->request('type', '');
            $paytime = $this->request->request('paytime', '');
            $extend = $this->request->request('extend', '');
            $sign = $this->request->request('sign', '');
            if ($sign != md5(md5($order_id . $out_order_id . $price . $realprice . $type . $paytime . $extend) . $config['secretkey'])) {
                $this->error('签名错误');
            }
            try {
                \addons\cms\model\Order::settle($out_order_id, $realprice);
            } catch (Exception $e) {

            }
            echo "success";
        } else {
            $order_id = $this->request->request('order_id', '');
            $out_order_id = $this->request->request('out_order_id', '');
            $sign = $this->request->request('sign', '');
            if ($sign != md5(md5($order_id . $out_order_id) . $config['secretkey'])) {
                $this->error('签名错误');
            }
            $order = \addons\cms\model\Order::get($out_order_id, ['archives']);
            if (!$order) {
                $this->error('订单未找到');
            }
            $this->success("恭喜你！支付成功!", $order->archives->url);
        }
        return;
    }

    /**
     * 企业支付通知和回调
     * @throws \think\exception\DbException
     */
    public function epay()
    {
        $type = $this->request->param('type');
        $paytype = $this->request->param('paytype');
        if ($type == 'notify') {
            $pay = \addons\epay\library\Service::checkNotify($paytype);
            if (!$pay) {
                echo '签名错误';
                return;
            }
            $data = $pay->verify();
            try {
                $payamount = $paytype == 'alipay' ? $data['total_amount'] : $data['total_fee'] / 100;
                \addons\cms\model\Order::settle($data['out_trade_no'], $payamount);
            } catch (Exception $e) {

            }
            echo $pay->success();
        } else {
            $pay = \addons\epay\library\Service::checkReturn($paytype);
            if (!$pay) {
                $this->error('签名错误');
            }
            $data = $pay->verify();

            $archives = Archives::get($data['out_trade_no']);
            if (!$archives) {
                $this->error('未找到文档信息!');
            }
            //你可以在这里定义你的提示信息,但切记不可在此编写逻辑
            $this->success("恭喜你！支付成功!", $archives->url);
        }
        return;
    }

}
