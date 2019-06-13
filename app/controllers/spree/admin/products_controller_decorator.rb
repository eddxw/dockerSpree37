module Spree
  module Admin
    ProductsController.class_eval do
      def stock
        @variant_id = params[:variant] if params[:variant]
        @stock_location_id = params[:stock_location] if params[:stock_location]

        @variants = @product.variants.includes(*variant_stock_includes)
        @variants = [@product.master] if @variants.empty?
        @stock_locations = StockLocation.accessible_by(current_ability, :read)
        if @stock_locations.empty?
          flash[:error] = Spree.t(:stock_management_requires_a_stock_location)
          redirect_to admin_stock_locations_path
        end
      end
      
    end
  end
end
# Spree::Admin::ProductsController.class_eval do
  # def stock
  #   # @variant_id = params[:variant] if params[:variant]
  #   # @stock_location_id = params[:stock_location] if params[:stock_location]

  #   @variants = @product.variants.includes(*variant_stock_includes)
  #   @variants = [@product.master] if @variants.empty?
  #   @stock_locations = StockLocation.accessible_by(current_ability, :read)
  #   if @stock_locations.empty?
  #     flash[:error] = Spree.t(:stock_management_requires_a_stock_location)
  #     redirect_to admin_stock_locations_path
  #   end
  # end
# end