# This migration comes from spree_pos (originally 20180405004230)
class AddNameToUsers < SpreeExtension::Migration[5.1]
  def change
    add_column :spree_users, :complete_name, :string
  end
end
