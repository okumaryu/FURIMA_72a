class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :productcondition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postagepayer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingdate
  #belongs_to_active_hash :size
  has_many :productphotos, dependent: :destroy
  accepts_nested_attributes_for :productphotos, allow_destroy: true
  belongs_to :brands
  accepts_nested_attributes_for :brands, allow_destroy: true
  #has_many :likes, dependent: :destroy
  #has_many :comments, dependent: :destroy
  #belongs_to :seller, class_name: "User"
  #belongs_to :buyer, class_name: "User"
end
