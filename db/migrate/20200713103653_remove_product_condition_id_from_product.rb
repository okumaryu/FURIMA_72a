class RemoveProductConditionIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :product_condition_id, :integer
  end
end
