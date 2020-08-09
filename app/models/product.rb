class Product < ApplicationRecord
  validates :name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :productcondition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postagepayer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingdate
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to :category
  has_many :productphotos, dependent: :destroy
  accepts_nested_attributes_for :productphotos, allow_destroy: true
  has_one :brand
  accepts_nested_attributes_for :brand
  #has_many :likes, dependent: :destroy
  #has_many :comments, dependent: :destroy
  #belongs_to :seller, class_name: "User"
  #belongs_to :buyer, class_name: "User"
end
