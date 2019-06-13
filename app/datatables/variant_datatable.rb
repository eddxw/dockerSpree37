# frozen_string_literal: true

class VariantDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      sku: { source: 'Spree::Variant.sku', cond: :like, searchable: true, orderable: true },
      name: { source: 'Spree::Product.name', cond: :like, searchable: true, orderable: true },
      stock: { source: 'Spree::StockItem.count_on_hand', searchable: false }
    }
  end

  # image_tag variant.images.first.attachment.url(:mini)
  def data
    records.map do |record|
      {
        image: record.decorate.image,
        sku: "#{record.sku} #{record.options_text}",
        name: record.name.truncate(50),
        stock: record.stock_items.find_by(stock_location_id: stock_location.id).count_on_hand,
        actions: record.decorate.actions(order, record.id),
        DT_RowId: record.id
      }
    end
  end

  def variant
    @variant ||= options[:variant]
  end

  def order
    @order ||= options[:order]
  end

  def user
    @user ||= options[:user]
  end

  def stock_location
    @stock_location ||= options[:stock_location]
  end

  def get_raw_records
    # insert query here
    # User.all
    Spree::Variant.includes(%i[product images stock_items]).limit(30).references(:product)
  end
end
