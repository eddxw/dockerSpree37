class AddGarantiaToSpreeLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_line_items, :garantia, :string
  end
end
