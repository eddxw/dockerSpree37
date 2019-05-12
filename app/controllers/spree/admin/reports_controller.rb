# frozen_string_literal: true

module Spree
  module Admin
    class ReportsController < Spree::Admin::BaseController
      respond_to :html

      class << self
        def available_reports
          @@available_reports
        end

        def add_available_report!(report_key, report_description_key = nil)
          if report_description_key.nil?
            report_description_key = "#{report_key}_description"
          end
          @@available_reports[report_key] = { name: Spree.t(report_key), description: Spree.t(report_description_key) }
        end
      end

      def initialize
        super
        ReportsController.add_available_report!(:sales_total)
      end

      def index
        @reports = ReportsController.available_reports
      end

      def users
        @users = Spree::User.all
        respond_to do |format|
          format.html
          format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
        end
      end

      def products
        @products = Spree::Product.not_deleted.not_discontinued.includes(:variants)
        respond_to do |format|
          format.html
          format.csv { send_data @products.to_csv, filename: "products-#{Date.today}.csv" }
        end
      end

      def variants
        @variants = Spree::Variant.joins(:product, :stock_items).group('spree_variants.id, spree_products.name').order(:id).select('spree_variants.id, spree_variants.sku, spree_products.name, SUM(count_on_hand) as total_on_hand, is_master')
        # @variants = Spree::Variant.not_deleted.not_discontinued.includes(:product).order(:id)
        respond_to do |format|
          format.html
          format.csv { send_data @variants.to_csv, filename: "variants-#{Date.today}.csv" }
        end
      end

      def sales_total
        params[:q] = {} unless params[:q]

        params[:q][:completed_at_gt] = if params[:q][:completed_at_gt].blank?
                                         Time.zone.now.beginning_of_month
                                       else
                                         begin
                                           Time.zone.parse(params[:q][:completed_at_gt]).beginning_of_day
                                         rescue StandardError
                                           Time.zone.now.beginning_of_month
                                         end
                                       end

        if params[:q] && !params[:q][:completed_at_lt].blank?
          params[:q][:completed_at_lt] = begin
                                           Time.zone.parse(params[:q][:completed_at_lt]).end_of_day
                                         rescue StandardError
                                           ''
                                         end
        end

        params[:q][:s] ||= 'completed_at desc'

        @search = Order.complete.ransack(params[:q])
        @orders = @search.result

        @totals = {}
        @orders.each do |order|
          @totals[order.currency] = { item_total: ::Money.new(0, order.currency), adjustment_total: ::Money.new(0, order.currency), sales_total: ::Money.new(0, order.currency) } unless @totals[order.currency]
          @totals[order.currency][:item_total] += order.display_item_total.money
          @totals[order.currency][:adjustment_total] += order.display_adjustment_total.money
          @totals[order.currency][:sales_total] += order.display_total.money
        end
      end

      private

      def model_class
        Spree::Admin::ReportsController
      end

      @@available_reports = {
        users: { name: I18n.t(:users), description: I18n.t(:users_report_description) },
        products: { name: I18n.t(:products), description: I18n.t(:products_export_description) },
        variants: { name: I18n.t(:variants), description: I18n.t(:variants_export_description) }
      }
    end
  end
end
