# This migration comes from spree_pos (originally 20190210164355)
class AddSalesmanToSpreeOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_orders, :salesman_id, :integer
  end
end
