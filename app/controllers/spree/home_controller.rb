module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      if params[:query].present?
        @products = Spree::Product.search(params[:query], limit: 20)
      else
        @searcher = build_searcher(params.merge(include_images: true))
        @products = @searcher.retrieve_products
        @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      end
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end