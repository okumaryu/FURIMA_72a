class Category < ActiveHash::Base
  self.data = [
    {id: 0, category: '選択してください'}, {id: 1, category: 'レディース'},{id: 2, category: 'ベビー・キッズ'},{id: 3, category: 'インテリア・住まい・小物'},
    {id: 4, category: '本・音楽・ゲーム'},{id: 5, category: 'おもちゃ・ホビー・グッズ'},{id: 6, category: 'コスメ・香水・美容'},{id: 7, category: '家電・スマホ・カメラ'},
    {id: 8, category: 'スポーツ・レジャー'},{id: 9, category: 'ハンドメイド'},{id: 10, category: 'チケット'},{id: 11, category: '自転車・オートバイ'},{id: 12, category: 'その他'}
  ]
end