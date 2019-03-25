# This migration comes from spree_pos (originally 20180404154037)
class AddEanToVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_variants, :ean, :string
  end
end
