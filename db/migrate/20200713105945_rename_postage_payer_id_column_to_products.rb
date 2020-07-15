class RenamePostagePayerIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :postage_payer_id, :postagepayer_id
  end
end
