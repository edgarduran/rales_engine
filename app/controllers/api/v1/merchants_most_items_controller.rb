class Api::V1::MerchantsMostItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.most_items(params[:quantity].to_i)
  end



end