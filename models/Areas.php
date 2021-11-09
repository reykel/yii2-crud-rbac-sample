<?php

namespace app\models;

use Yii;
use Yii\helpers\ArrayHelper;

/**
 * This is the model class for table "tbl_areas".
 *
 * @property int $id
 * @property string $area
 */
class Areas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_areas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['area'], 'required'],
            [['area'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'area' => 'Area',
        ];
    }

    public function get_areas()
    {
        $model = Areas::find()->All();
        return ArrayHelper::map($model, 'id', 'area');
    }
}
