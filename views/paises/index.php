<?php

use yii\helpers\Html;
use yii\grid\GridView;
use fedemotta\datatables\DataTables;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PaisesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Países';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="paises-index">

    <h1><?= Html::encode($this->title) ?></h1>

<div  align="right">
        <?php echo '<a class="btn btn-primary btn-large" href="index.php?r=paises/create">'; ?> 
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>

<?= DataTables::widget([
    'dataProvider' => $dataProvider,
    'filterModel' => $searchModel,
    'tableOptions' => ["class"=>"table table-striped table-condensed","cellspacing"=>"0", "width"=>"100%"],
    'clientOptions' => [
        'responsive' => true,
    ],
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
            'CodPais',
            'Codigo',
            'Siglas',
            'Area',
        [
            'attribute' => 'DescPais',
            'format' => 'text',
            'label' => 'País',
        ],            
        [
          'class' => 'yii\grid\ActionColumn',
          'headerOptions' => ['style' => 'width:90px'],
          'template' => '{update}{delete}',
          'buttons' => [
            'update' => function ($url, $model) {
                return Html::a('<span class="btn btn-success btn-sm glyphicon glyphicon-edit" style="margin: 1px"></span>', $url, [
                    'title' => Yii::t('app', 'lead-update'),
                ]);
            },
            'delete' => function($url, $model){
                return Html::a('<span class="btn btn-danger btn-sm glyphicon glyphicon-trash" style="margin: 1px""></span>', $url,
                [                                    
                    'data' => [
                        'confirm' => Yii::t('yii','Procederá a eliminar el registro seleccionado, desea continuar?'),
                        'method' => 'post',
                        'pjax' => 0,                                            
                        'title' => Yii::t('yii', 'Confirmar operación'),
                        'ok' => Yii::t('yii', 'Confirmar'),
                        'cancel' => Yii::t('yii', 'Cancelar'),
                    ],
                ]);
            }

          ],
          'urlCreator' => function ($action, $model, $key, $index) {
            if ($action === 'update') {
                $url ='index.php?r=paises/update&id='.$model->CodPais;
                return $url;
            }
            if ($action === 'delete') {
                $url ='index.php?r=paises/delete&id='.$model->CodPais;
                return $url;
            }
          }
        ],
    ],
]);?>
</div>
