# frozen_string_literal: true

module Spree
  Variant.class_eval do
    self.whitelisted_ransackable_attributes << 'ean'
    scope :available_at_stock_location, ->(stock_location_id) { active.joins(:stock_items).where('spree_stock_items.count_on_hand > 0 AND spree_stock_items.stock_location_id = ?', stock_location_id) }
    validates :ean, uniqueness: { conditions: -> { where(deleted_at: nil) } }, allow_blank: true
  
    def self.to_csv
      attributes = %w[id sku name total_on_hand]

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |record|
          csv << attributes.map { |attr| record.send(attr) }
        end
      end
    end
  end
end
