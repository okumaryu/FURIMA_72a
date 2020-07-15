class RenamePrefectureCodeColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :prefecture_code, :prefecture_id
  end
end
