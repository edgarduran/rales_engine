class Api::V1::MerchantsMostItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

end
