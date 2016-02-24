class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json

  def show
    invoice = Invoice.find(params[:invoice_id])
    respond_with invoice.merchant
  end

end
