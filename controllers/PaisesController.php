<?php

namespace app\controllers;

use Yii;
use app\models\Paises;
use app\models\PaisesSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\httpclient\Client;

/**
 * PaisesController implements the CRUD actions for Paises model.
 */
class PaisesController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Paises models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PaisesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Paises model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Paises model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Paises();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Paises model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Paises model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Paises model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Paises the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Paises::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    //************REST TRIALS**************//

    public function actionRest_list()
    {
        $_data = '';

        $client = new Client();

        $response = $client->createRequest()
            ->setMethod('GET')
            //->addHeaders(['content-type' => 'application/json'])
            ->setUrl('http://localhost/yii-rest/web/books?page=1&per-page=10')
            ->setFormat(Client::FORMAT_JSON)
            ->send();

        if ($response->isOk) {
            $_data = $response->data;
        }

        return $this->render('rest_index', [
            '_data' =>  $_data,
        ]);        
    }

    public function actionRest_select()
    {
        $_data = '';

        $client = new Client();

        $response = $client->createRequest()
            ->setMethod('GET')
            ->setUrl('http://localhost/yii-rest/web/books/1')
            ->setFormat(Client::FORMAT_JSON)
            ->send();

        if ($response->isOk) {
            $_data = $response->data;
        }

        return $this->render('rest_index', [
            '_data' =>  $_data,
        ]);        
    }    

    public function actionRest_create()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('POST')
            ->setUrl('http://localhost/yii-rest/web/books')
            ->setData([
                'name' => 'Reynier',
                'author' => 'Programación',
                'release_year' => '2021',
                'is_available_for_loan' => '1'
            ])
        ->send();      
    }

    public function actionRest_update()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('PUT')
            ->setUrl('http://localhost/yii-rest/web/books/52')
            ->setData([
                'name' => 'Reynier',
                'author' => 'Machine Learning',
                'release_year' => '2022',
                'is_available_for_loan' => '1'
            ])
        ->send();      
    }

    public function actionRest_delete()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('DELETE')
            ->setUrl('http://localhost/yii-rest/web/books/52')
        ->send();      
    }        

//*****************AUTENTICACIONES*********************//

    public function actionRest_signup()
    {
        $_data = '';

        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('POST')
            ->setUrl('http://localhost/advanced/api/web/signup')
            ->setData([
                'username' => 'root',
                'email' => 'rey@gmail.com',
                'password' => '',
            ])
        ->send();      
        
//        $_data = $response->data;

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);          
    }

    public function actionRest_login()
    {
        $_data = '';

        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('POST')
            ->setUrl('http://localhost/advanced/api/web/login')
            ->setData([
                'username' => 'root',
                'password' => '',
            ])
        ->send();      
        
        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);          
    }

    public function actionRest_list_post()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setHeaders(['authorization' => 'Bearer '.'dbpEh8jTCxTUorvOKHsUTxDFFshgOrs6'])
            ->setMethod('GET')
            ->setUrl('http://localhost/advanced/api/web/v1/post')
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);
    }

    public function actionRest_select_post()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setHeaders(['authorization' => 'Bearer '.'dbpEh8jTCxTUorvOKHsUTxDFFshgOrs6'])
            ->setMethod('GET')
            ->setUrl('http://localhost/advanced/api/web/v1/post/view?id=1')
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);
    }

    public function actionRest_update_post()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setHeaders(['authorization' => 'Bearer '.'dbpEh8jTCxTUorvOKHsUTxDFFshgOrs6'])
            ->setMethod('PUT')
            ->setUrl('http://localhost/advanced/api/web/v1/post/update?id=1')
            ->setData([
                'title' => 'Reynier',
                'body' => 'Machine Learning',
            ])            
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);
    }

    public function actionRest_create_post()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setHeaders(['authorization' => 'Bearer '.'dbpEh8jTCxTUorvOKHsUTxDFFshgOrs6'])
            ->setMethod('POST')
            ->setUrl('http://localhost/advanced/api/web/v1/post/create')
            ->setData([
                'title' => 'Prueba',
                'body' => 'Otra prueba mas',
            ])            
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);
    }

    public function actionRest_delete_post()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setHeaders(['authorization' => 'Bearer '.'dbpEh8jTCxTUorvOKHsUTxDFFshgOrs6'])
            ->setMethod('DELETE')
            ->setUrl('http://localhost/advanced/api/web/v1/post/delete?id=2')
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);
    }
//*****************DJANGO*********************//

    public function actionRest_create_todo()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('POST')
            ->setHeaders(['authorization' => 'Token '.'18dc2060106c520d060dd4c26e6c0284b143b8f9'])            
            ->setUrl('http://localhost:8000/api/v1/todo/create/')
            ->setData([
                'date_created' => '2020-11-19',
                'title' => 'Go to School',
                'body' => 'Go Buy Goods from the market',
                'is_completed' => true
            ])
        ->send();      
    }

    public function actionRest_list_todo()
    {
        $_data = '';

        $client = new Client();

        $response = $client->createRequest()
            ->setMethod('GET')
            ->setHeaders(['authorization' => 'Token '.'18dc2060106c520d060dd4c26e6c0284b143b8f9']) 
            ->setUrl('http://localhost:8000/api/v1/todo')
            ->setFormat(Client::FORMAT_JSON)
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);        
    }    

    public function actionRest_update_todo()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('PUT')
            ->setHeaders(['authorization' => 'Token '.'18dc2060106c520d060dd4c26e6c0284b143b8f9'])            
            ->setUrl('http://localhost:8000/api/v1/todo/update/1/')
            ->setData([
                'date_created' => '2020-11-19',
                'title' => 'Go back home',
                'body' => 'Go Buy Goods from the market',
                'is_completed' => false
            ])
        ->send();      
    }    

    public function actionRest_delete_todo()
    {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('DELETE')
            ->setHeaders(['authorization' => 'Token '.'18dc2060106c520d060dd4c26e6c0284b143b8f9'])            
            ->setUrl('http://localhost:8000/api/v1/todo/delete/1/')
        ->send();      
    }

    public function actionRest_token_todo()
    {
        $client = new Client();

        $response = $client->createRequest()
            ->setMethod('POST')
            ->setUrl('http://127.0.0.1:8000/api-token-auth/')
            ->setData([
                'username' => 'root',
                'password' => '',
            ])            
            ->send();

        return $this->render('rest_index', [
            '_data' =>  $response->data,
        ]);        
    }

}