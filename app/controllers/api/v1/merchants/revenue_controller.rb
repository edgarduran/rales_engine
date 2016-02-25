class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      respond_with ({ "revenue" => Merchant.find(params[:merchant_id]).revenue_by_date(params)})
    else
      respond_with ({ "revenue" => Merchant.find(params[:merchant_id]).total_revenue(params)})
    end
  end

end
