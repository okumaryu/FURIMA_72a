class CreateProductphotos < ActiveRecord::Migration[5.2]
  def change
    create_table :productphotos do |t|
      t.string :url,null: false
      t.references :product, foreign_key: true
      #t.integer	:product_id, null: false, foreign_key: true
    end
  end
end
