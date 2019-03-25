# This migration comes from spree_pos (originally 20131025110309)
class AddCardNameToSpreePayments < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_payments, :card_name, :string
  end
end
