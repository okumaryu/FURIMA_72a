class Shippingdate < ActiveHash::Base
  self.data = [
  {id: 0, name: '１〜２日で発送'}, {id: 1, name: '２〜３日で発送'},{id:2, name: '４〜７日で発送'}
  ]
end