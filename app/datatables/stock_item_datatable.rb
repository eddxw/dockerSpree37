# frozen_string_literal: true

class StockItemDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: 'Spree::Variant.id', searchable: true },
      name: { source: 'Spree::Product.name' },
      sku: { source: 'Spree::Variant.sku' },
      count_on_hand: { source: 'Spree::StockItem.count_on_hand', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        image: record.decorate.stock_image,
        name: record.product.name,
        sku: record.sku_and_options_text,
        count_on_hand: record.total_on_hand,
        dt_actions: record.decorate.stock_actions
      }
    end
  end

  def almacen
    @almacen ||= options[:almacen]
  end
  
  def get_raw_records
    # almacen.stock_items.includes(variant: [:product, :images, option_values: :option_type])
    # .references(:product)
    # Spree::Variant.joins(:product, :stock_items).group('spree_variants.id, spree_products.name, spree_stock_items.variant_id').order(:id).select('spree_variants.id, spree_variants.sku, spree_products.name, SUM(count_on_hand) as xtotal_on_hand, is_master, product_id')
    # Spree::Variant.joins(:product, :stock_items).group('spree_variants.id').select('spree_variants.id, spree_variants.sku, spree_products.name, SUM(count_on_hand) as xtotal_on_hand, is_master, product_id, track_inventory')
  
    # Spree::Variant.joins(:product, :stock_items).distinct
    Spree::Variant.includes(:product, :stock_items).references(:product, :stock_items).not_discontinued.not_deleted.where("spree_products.discontinue_on IS NULL or spree_products.discontinue_on >= ?", Time.zone.now).distinct
  
  end
end
