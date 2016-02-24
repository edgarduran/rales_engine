class Api::V1::MerchantsFindController < ApplicationController
  respond_to :json

  def index
    if params["name"]
      respond_with Merchant.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Merchant.where("#{params.first.first}": params.first.last)
    end
  end

  def show
    if params['name']
      respond_with Merchant.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Merchant.where("#{params.first.first}": params.first.last).first
    end
  end

end
