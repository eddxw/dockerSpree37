# frozen_string_literal: true

module Spree
  Product.class_eval do
    def self.to_csv
      attributes = %w[id name description available_on slug promotionable shipping_category_id sku is_master cost_price]

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |record|
          csv << attributes.map { |attr| record.send(attr) }
        end
      end
    end
  end
end
