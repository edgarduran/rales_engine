class Api::V1::MerchantsRevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all.most_revenue(params)
  end

  def show
    respond_with Merchant.all.total_revenue_by_date(params)
  end

end
