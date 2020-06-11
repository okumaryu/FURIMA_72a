# Design DataBase scheme

## Users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|
### Association
- has_one :profile, dependent: :destroy
- has_one :addresse, dependent: :destroy
- has_one :creditcard, dependent: :destroy
- has_many :seller_products, foreign_key: "seller_id", class_name: "products"
- has_many :buyer_products, foreign_key: "buyer_id", class_name: "products"
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :todolists

## Profiles
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_rubi|string|null: false|
|first_name_rubi|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|introduntion|text||
|avatar|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## Addresses
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_rubi|string|null: false|
|destination_first_name_rubi|string|null: false|
|zipcode|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## Creditcards
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiry_year|integer(2)|null: false|
|expiry_month|integer(2)|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## Products
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand_id|integer|foreign_key: true|
|category_id|string|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|product_condition_id|integer|null: false, foreign_key: true|
|prefecture_code|integer|null: false|
|postage_payer_id|integer|null: false, foreign_key: true|
|shipping_date_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :brand
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :shipping_date
- has_many :productphotoes, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

## Productphotoes
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## Brands
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :products

## Categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :products

## Sizes (active_hash)
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :products

## Product_conditions (active_hash)
|Column|Type|Options|
|------|----|-------|
|product_condition|string|null: false|
### Association
- has_many :products

## Postage_payers (active_hash)
|Column|Type|Options|
|------|----|-------|
|Postage_payer|string|null: false|
### Association
- has_many :products

## shipping_dates (active_hash)
|Column|Type|Options|
|------|----|-------|
|shipping_date|string|null: false|
### Association
- has_many :products

## Likes
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Todolists
|Column|Type|Options|
|------|----|-------|
|list|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
