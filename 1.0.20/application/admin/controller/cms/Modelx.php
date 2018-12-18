<?php

namespace app\admin\controller\cms;

use app\common\controller\Backend;

/**
 * 内容模型表
 *
 * @icon fa fa-circle-o
 */
class Modelx extends Backend
{

    /**
     * Model模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\cms\Modelx;
    }

}
