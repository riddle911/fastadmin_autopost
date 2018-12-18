<?php

namespace app\admin\model\cms;

use addons\cms\library\Alter;
use app\common\model\Config;
use think\Exception;
use think\exception\PDOException;
use think\Model;

class Fields extends Model
{

    // 表名
    protected $name = 'cms_fields';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
        'status_text',
        'content_list',
    ];
    protected static $listField = ['select', 'selects', 'checkbox', 'radio', 'array'];

    public function setError($error)
    {
        $this->error = $error;
    }

    protected static function init()
    {
        $beforeUpdateCallback = function ($row) {

        };

        $afterInsertCallback = function ($row) {
            //为了避免引起更新的事件回调，这里采用直接执行SQL的写法
            $row->query($row->fetchSql(true)->update(['id' => $row['id'], 'weigh' => $row['id']]));
            $field = $row['model_id'] ? 'model_id' : 'diyform_id';
            $model = $row['model_id'] ? Modelx::get($row[$field]) : Diyform::get($row[$field]);
            if ($model) {
                $sql = Alter::instance()
                    ->setTable($model['table'])
                    ->setName($row['name'])
                    ->setLength($row['length'])
                    ->setContent($row['content'])
                    ->setDecimals($row['decimals'])
                    ->setDefaultvalue($row['defaultvalue'])
                    ->setComment($row['title'])
                    ->setType($row['type'])
                    ->getAddSql();
                try {
                    db()->query($sql);
                    $fields = Fields::where($field, $model['id'])->field('name')->column('name');
                    $model->fields = implode(',', $fields);
                    $model->save();
                } catch (PDOException $e) {
                    $row->getQuery()->where('id', $row->id)->delete();
                    throw new Exception($e->getMessage());
                }
            }
        };
        $afterUpdateCallback = function ($row) {
            $field = $row['model_id'] ? 'model_id' : 'diyform_id';
            $model = $row['model_id'] ? Modelx::get($row[$field]) : Diyform::get($row[$field]);
            if ($model) {
                $alter = Alter::instance();
                if (isset($row['oldname']) && $row['oldname'] != $row['name']) {
                    $alter->setOldname($row['oldname']);
                }
                $sql = $alter
                    ->setTable($model['table'])
                    ->setName($row['name'])
                    ->setLength($row['length'])
                    ->setContent($row['content'])
                    ->setDecimals($row['decimals'])
                    ->setDefaultvalue($row['defaultvalue'])
                    ->setComment($row['title'])
                    ->setType($row['type'])
                    ->getModifySql();
                db()->query($sql);
                $fields = Fields::where($field, $model['id'])->field('name')->column('name');
                $model->fields = implode(',', $fields);
                $model->save();
            }
        };

        self::beforeInsert($beforeUpdateCallback);
        self::beforeUpdate($beforeUpdateCallback);

        self::afterInsert($afterInsertCallback);
        self::afterUpdate($afterUpdateCallback);

        self::afterDelete(function ($row) {
            $field = $row['model_id'] ? 'model_id' : 'diyform_id';
            $model = $row['model_id'] ? Modelx::get($row[$field]) : Diyform::get($row[$field]);
            if ($model) {
                $sql = Alter::instance()
                    ->setTable($model['table'])
                    ->setName($row['name'])
                    ->getDropSql();
                try {
                    db()->query($sql);
                } catch (PDOException $e) {

                }
            }
        });
    }

    public function getContentListAttr($value, $data)
    {
        return in_array($data['type'], self::$listField) ? Config::decode($data['content']) : $data['content'];
    }

    public function getStatusList()
    {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function model()
    {
        return $this->belongsTo('Modelx', 'model_id')->setEagerlyType(0);
    }

    public function diyform()
    {
        return $this->belongsTo('Diyform', 'diyform_id')->setEagerlyType(0);
    }

}
