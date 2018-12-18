<?php

namespace app\admin\controller\cms;

use app\common\controller\Backend;

/**
 * 标签表
 *
 * @icon tags
 */
class Tags extends Backend
{

    /**
     * Tags模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\cms\Tags;
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个方法
     * 因此在当前控制器中可不用编写增删改查的代码,如果需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    public function selectpage()
    {
        $response = parent::selectpage();
        $word = (array)$this->request->request("q_word/a");
        if (array_filter($word)) {
            $result = $response->getData();
            foreach ($word as $k => $v) {
                array_unshift($result['list'], ['id' => $v, 'name' => $v]);
                $result['total']++;
            }
            $response->data($result);
        }
        return $response;
    }

}
