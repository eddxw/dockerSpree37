module Spree
  ProductsController.class_eval do
    def autocomplete
      render json: Spree::Product.search(params[:query], {
        fields: ["name^5", "sku"],
        match: :word_start,
        limit: 10,
        load: false,
        misspellings: {below: 5}
      }).map(&:sku)
    end
  end
end