class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  respond_to :json

  def index
    merchant =  Merchant.find(params[:merchant_id])
    respond_with merchant.pending_invoices(params)
  end

end
