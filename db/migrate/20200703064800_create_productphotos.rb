class CreateProductphotos < ActiveRecord::Migration[5.2]
  def change
    create_table :productphotos do |t|
      t.string :src
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
