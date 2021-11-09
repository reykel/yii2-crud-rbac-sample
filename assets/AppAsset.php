<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'css/datatables.css',
        'DataTables-1.10.13/css/dataTables.bootstrap.css',
        'Responsive-2.1.0/css/responsive.bootstrap.css',

        'css/alertify.bootstrap.css',
        'css/alertify.core.css',
        'css/alertify.default.css',
        'css/jquery.noty.css',
        'css/noty_theme_default.css',
    ];
    public $js = [
            'DataTables-1.10.13/js/dataTables.bootstrap.js',
            'Responsive-2.1.0/js/dataTables.responsive.js',
            'js/alertify.js',
            'js/jquery.noty.js',
            'js/bootbox.all.js',
            'js/bootbox.js',
            'js/bootbox.locales.js',
            'js/override_default.js',            

    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
