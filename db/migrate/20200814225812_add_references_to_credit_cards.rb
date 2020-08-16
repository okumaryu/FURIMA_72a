class AddReferencesToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :credit_cards, :user, null: false, foreign_key: true
  end
end
