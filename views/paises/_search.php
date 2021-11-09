<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\PaisesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="paises-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'CodPais') ?>

    <?= $form->field($model, 'Codigo') ?>

    <?= $form->field($model, 'DescPais') ?>

    <?= $form->field($model, 'Siglas') ?>

    <?= $form->field($model, 'Area') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
