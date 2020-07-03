class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer	:brand_id, foreign_key: true
      t.string :category_id, null: false, foreign_key: true
      t.integer	:size_id,null: false, foreign_key: true
      t.integer	:product_condition_id,	null: false, foreign_key: true
      t.integer	:prefecture_code, null: false
      t.integer	:postage_payer_id, null: false, foreign_key: true
      t.integer	:shipping_date_id, null:false, foreign_key: true
      t.integer	:seller_id, null: false, foreign_key: true
      t.integer	:buyer_id, null: false, foreign_key: true
    end
  end
end
