class AddProductconditionIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :productcondition_id, :integer
  end
end
