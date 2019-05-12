# frozen_string_literal: true

module Spree
  Variant.class_eval do
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
