class RenameShippingDateIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :shipping_date_id, :shippingdate_id
  end
end
