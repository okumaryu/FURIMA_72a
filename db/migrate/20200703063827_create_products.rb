class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price#, null: false
      t.text :description#, null: false
      t.integer	:brand_id#, foreign_key: true
      t.string :category_id#, null: false, foreign_key: true
      t.integer	:size_id#,null: false, foreign_key: true
      t.integer	:productcondition_id#,	null: false, foreign_key: true
      t.integer	:prefecturei_d#, null: false
      t.integer	:postagepayer_id#, null: false, foreign_key: true
      t.integer	:shippingdate_id#, null:false, foreign_key: true
      t.integer	:seller_id#, null: false, foreign_key: true
      t.integer	:buyer_id#, null: false, foreign_key: true
    end
  end
end
