class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    customer = Customer.find(params[:customer_id])
    respond_with customer.favorite_merchant(params)
  end

end
