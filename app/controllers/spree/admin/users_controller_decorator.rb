Spree::Admin::UsersController.class_eval do
  def user_params
    params.require(:user).permit(permitted_user_attributes |
                                 [:use_billing,
                                  spree_role_ids: [],
                                  stock_location_ids: [],
                                  ship_address_attributes: permitted_address_attributes,
                                  bill_address_attributes: permitted_address_attributes])
  end
  
  def index
    respond_to do |format|
      format.html
      # format.json { render json: UserDatatable.new(params) }
      format.json { render json: UserDatatable.new(params) }
    end
  end
end
