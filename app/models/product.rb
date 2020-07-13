class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  #belongs_to :brand
  #belongs_to :category
  #belongs_to_active_hash :size
  #belongs_to :product_condition
  #belongs_to :postage_payer
  #belongs_to :shipping_date
  has_many :productphotos, dependent: :destroy
  accepts_nested_attributes_for :productphotos, allow_destroy: true
  #has_many :likes, dependent: :destroy
  #has_many :comments, dependent: :destroy
  #belongs_to :seller, class_name: "User"
  #belongs_to :buyer, class_name: "User"
  #extend ActiveHash::Associations::ActiveRecordExtensions
  #has_many :postage_payer
  
end
