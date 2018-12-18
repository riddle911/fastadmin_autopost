<?php

namespace app\admin\controller\cms;

use app\common\controller\Backend;
use app\common\model\Config;

/**
 * 模型字段表
 *
 * @icon fa fa-circle-o
 */
class Fields extends Backend
{

    /**
     * Fields模型对象
     */
    protected $model = null;
    protected $modelValidate = true;
    protected $modelSceneValidate = true;

    protected $noNeedRight = ['rulelist'];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\cms\Fields;
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign('typeList', Config::getTypeList());
        $this->view->assign('regexList', Config::getRegexList());
    }

    /**
     * 查看
     */
    public function index()
    {
        $model_id = $this->request->param('model_id', 0);
        $diyform_id = $this->request->param('diyform_id', 0);
        $condition = $model_id ? ['model_id' => $model_id] : ['diyform_id' => $diyform_id];
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($condition)
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($condition)
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        $this->assignconfig('model_id', $model_id);
        $this->assignconfig('diyform_id', $diyform_id);
        $this->view->assign('model_id', $model_id);
        $this->view->assign('diyform_id', $diyform_id);

        $model = $model_id ? \app\admin\model\cms\Modelx::get($model_id) : \app\admin\model\cms\Diyform::get($diyform_id);
        $this->view->assign('model', $model);
        $modelList = $model_id ? \app\admin\model\cms\Modelx::all() : \app\admin\model\cms\Diyform::all();
        $this->view->assign('modelList', $modelList);

        return $this->view->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        $model_id = $this->request->param('model_id', 0);
        $diyform_id = $this->request->param('diyform_id', 0);
        $this->view->assign('model_id', $model_id);
        $this->view->assign('diyform_id', $diyform_id);
        return parent::add();
    }

    /**
     * 批量操作
     * @param string $ids
     */
    public function multi($ids = "")
    {
        $params = $this->request->request('params');
        parse_str($params, $paramsArr);
        if (isset($paramsArr['isfilter'])) {
            $field = \app\admin\model\cms\Fields::get($ids);
            if (!$field || !in_array($field['type'], ['radio', 'checkbox', 'select', 'selects', 'array'])) {
                $this->error('只有类型为单选、复选、下拉列表、数组才可以加入列表筛选');
            }
        }
        return parent::multi($ids);
    }

    /**
     * 规则列表
     * @internal
     */
    public function rulelist()
    {
        //主键
        $primarykey = $this->request->request("keyField");
        //主键值
        $keyValue = $this->request->request("keyValue", "");

        $keyValueArr = array_filter(explode(',', $keyValue));
        $regexList = Config::getRegexList();
        $list = [];
        foreach ($regexList as $k => $v) {
            if ($keyValueArr) {
                if (in_array($k, $keyValueArr)) {
                    $list[] = ['id' => $k, 'name' => $v];
                }
            } else {
                $list[] = ['id' => $k, 'name' => $v];
            }
        }
        return json(['list' => $list]);
    }

}
