<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_paises".
 *
 * @property int $CodPais
 * @property string|null $Codigo
 * @property string|null $DescPais
 * @property string|null $Siglas
 * @property string|null $Area
 */
class Paises extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_paises';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            ['Codigo', 'string', 'max' => 50],
            ['DescPais', 'string', 'max' => 255],
            ['Siglas', 'string', 'max' => 50],
            ['Area', 'string', 'max' => 50],
            [ ['Area', 'Codigo', 'DescPais', 'Siglas'], 'required'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'CodPais' => 'Cod Pais',
            'Codigo' => 'Codigo',
            'DescPais' => 'Desc Pais',
            'Siglas' => 'Siglas',
            'Area' => 'Area',
        ];
    }

    public function get_siglas()
    {
        return [
            'LATAM' => 'Latinoamérica',
            'AFR' => 'Africa',
            'EU' => 'Europa',
            'Asia' => 'Asia',
            'USA' => 'Estados Unidos',
        ];
    }    
}
