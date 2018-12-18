<?php

namespace addons\cms\controller;

use addons\cms\model\Archives;
use addons\cms\model\Tags as TagsModel;

/**
 * 标签控制器
 */
class User extends Base
{


    public function __construct()
    {
        parent::__construct();
        $config = get_addon_config('cms');
        $this->view->engine->config('view_path', APP_PATH . 'index' . DS . 'view' . DS);
    }

    public function index()
    {
        return $this->view->fetch('/user/index');
    }

}
