# Design DataBase scheme

## Users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|
### Association
- has_one :Profiles, dependent: :destroy
- has_one :Addresses, dependent: :destroy
- has_one :Creditcards, dependent: :destroy
- has_many :seller_products, foreign_key: "seller_id", class_name: "products"
- has_many :buyer_products, foreign_key: "buyer_id", class_name: "products"
- has_many :Likes, dependent: :destroy
- has_many :Comments, dependent: :destroy
- has_many :Todolists

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
|productphoto_id|integer|null: false, foreign_key: true|
|description|text|null: false|
|price|integer|null: false|
|brand_id|integer|foreign_key: true|
|category_id|string|null: false, foreign_key: true|
|size|string|null: false|
|product_condition|string|null: false|
|prefecture_code|integer|null: false|
|postage_payer|string|null: false|
|shipping_date|string|null: false|
|seller_id|string|null: false, foreign_key: true|
|buyer_id|string|null: false, foreign_key: true|
### Association
- belongs_to :Brand
- belongs_to :Category
- has_many :Productphotoes, dependent: :destroy
- has_many :Likes, dependent: :destroy
- has_many :Comments, dependent: :destroy
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
- has_many :product

## Categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :product

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
