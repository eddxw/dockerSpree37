# frozen_string_literal: true

module Spree
  User.class_eval do
    def self.to_csv
      attributes = %w[id email complete_name encrypted_password password_salt]

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |user|
          csv << attributes.map { |attr| user.send(attr) }
        end
      end
    end
  end
end
