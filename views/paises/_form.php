<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use app\models\Areas;
use app\models\Paises;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Paises */
/* @var $form yii\widgets\ActiveForm */

?>
<div class="paises-form">
<?php $form = ActiveForm::begin(
            ['layout' => 'horizontal',
                    'method' => 'post',
                    'fieldConfig' => [
                        'horizontalCssClasses' => [
                        ],
                    ],
             ]
    ); ?>

<div class = 'well'>
    <?= $form->field($model, 'DescPais', ['inputOptions' => ['placeholder' => $model->getAttributeLabel('DescPais'),], ])->label(); ?>

	<?= $form->field($model, 'DescPais')->textInput()->label('País') ?>    

    <?= $form->field($model, 'Codigo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'DescPais')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Siglas')->dropDownList(Paises::get_siglas(), ['prompt' => 'Seleccione...']) ?>


    <?= $form->field($model, 'Area')->dropDownList(Areas::get_areas(), ['prompt' => 'Seleccione...']) ?>

	<div align="center">
        <div class="control-group">
		  <div class='controls'>
            	<?= Html::submitButton($model->isNewRecord ? 'Agregar' : 'Modificar', ['class' => 'btn btn-primary btn-large']) ?>
        	   <?php echo '<a class="btn btn-danger btn-large" href="index.php?r=paises/index">'; ?> 
            	   Cancelar
            	</a>
        	</div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>
</div>
</div>
