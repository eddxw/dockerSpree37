Spree::Admin::StockItemsController.class_eval do
  def index
    # location = params[:stock_location].present? ? Spree::StockLocation.find_by(id: params[:stock_location]) : Spree::StockLocation.first
    @stock_location ||= params[:stock_location].present? ? Spree::StockLocation.find_by(id: params[:stock_location]) : Spree::StockLocation.first
    # @stock_location = Spree::StockLocation.find_by(id: params[:stock_location])
    puts "$$$---***"
    p @stock_location
    respond_to do |format|
      format.html {}
      format.json { render json: StockItemDatatable.new(params, almacen: @stock_location) }
    end
  end
end