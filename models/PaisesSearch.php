<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Paises;

/**
 * PaisesSearch represents the model behind the search form of `app\models\Paises`.
 */
class PaisesSearch extends Paises
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['CodPais'], 'integer'],
            [['Codigo', 'DescPais', 'Siglas', 'Area'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Paises::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'CodPais' => $this->CodPais,
        ]);

        $query->andFilterWhere(['like', 'Codigo', $this->Codigo])
            ->andFilterWhere(['like', 'DescPais', $this->DescPais])
            ->andFilterWhere(['like', 'Siglas', $this->Siglas])
            ->andFilterWhere(['like', 'Area', $this->Area]);

        return $dataProvider;
    }
}
