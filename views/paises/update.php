<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Paises */

$this->title = 'Modificar registro: ' . $model->DescPais;
?>
<div class="paises-update">

    <h1><?= Html::encode($this->title) ?></h1>
<br>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
