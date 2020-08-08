class Size < ActiveHash::Base
  class Prefecture < ActiveHash::Base
    self.data = [
        {id: 1, size: 'XXS以下'}, {id: 2, size: 'XS'}, {id: 3, seize: 'S'},
        {id: 4, size: 'M'}, {id: 5, size: 'L'}, {id: 6, size: 'XL'},
        {id: 7, size: '２XL'}, {id: 8, size: '３XL'}, {id: 9, seize: '４XL以上'},
        {id:10, size: 'FREE SIZE'}, {id: 11, size: '秋田県'}, {id: 12, size: '山形県'},
        {id: 13, size: '20cm以下'}, {id: 14, size: '20.5cm'}, {id: 15, seize: '21cm'},
        {id: 16, size: '21.5cm'}, {id: 17, size: '22cm'}, {id: 18, size: '22.5cm'},
        {id: 19, size: '23cm'}, {id: 20, size: '23.5cm'}, {id: 21, seize: '24cm'},
        {id: 22, size: '24.5cm'}, {id: 23, size: '25cm'}, {id: 24, size: '25.5cm'},
        {id: 25, size: '26cm'}, {id: 26, size: '26.5cm'}, {id: 27, seize: '27cm'},
        {id: 28, size: '27.5cm以上'}
    ]
  end
end