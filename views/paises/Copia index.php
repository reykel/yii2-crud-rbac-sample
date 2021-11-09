<?php

use yii\helpers\Html;
use yii\grid\GridView;
use fedemotta\datatables\DataTables;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PaisesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Países';
$this->params['breadcrumbs'][] = $this->title;
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
          //'header' => 'Actions',
          'headerOptions' => ['style' => 'width:90px'],
          'template' => '{update}{delete}',
          'buttons' => [
            'update' => function ($url, $model) {
                return Html::a('<span class="btn btn-success btn-sm glyphicon glyphicon-edit" style="margin: 1px"></span>', $url, [
                    'title' => Yii::t('app', 'lead-update'),
                ]);
            },
            'delete' => function ($url, $model) {
                return Html::a('<span class="btn btn-danger btn-sm glyphicon glyphicon-trash" style="margin: 1px"></span>', $url, [
                    'title' => Yii::t('app', 'lead-delete'),
                    'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                    //'onClick' => 'confirm("Your confirmation message?")',
                    'data-method' => 'post',
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

<script>
    $('.btn-danger').click(function(e){
        e.preventDefault();
        var location = $(this).attr("href");
        alertify.confirm("Procederá a eliminar el registro seleccionado, desea continuar?", function(confirm) {
            if (!confirm) {
                e.preventDefault();
                noty({"text":"Eliminación cancelada","layout":"topCenter","type":"error","animateOpen": {"opacity": "show"}});
            }else{
                noty({"text":"Eliminación correctamente efectuada","layout":"topCenter","type":"success","animateOpen": {"opacity": "show"}});
                window.location = location;
            }
        });
    });
</script>