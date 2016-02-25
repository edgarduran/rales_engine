class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:merchant_id])
    respond_with merchant.favorite_customer(params)
  end

end
