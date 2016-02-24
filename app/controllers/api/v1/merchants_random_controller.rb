class Api::V1::MerchantsRandomController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.order("RANDOM()").first
  end

end
