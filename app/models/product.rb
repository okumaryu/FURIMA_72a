class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to_active_hash :size
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_date
  has_many :productphotoes, dependent: :destroy
  #has_many :likes, dependent: :destroy
  #has_many :comments, dependent: :destroy
  #belongs_to :seller, class_name: "User"
  #belongs_to :buyer, class_name: "User"
end
