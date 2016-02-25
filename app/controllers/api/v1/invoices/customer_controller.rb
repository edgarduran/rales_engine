class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json

  def show
    invoice = Invoice.find(params[:invoice_id])
    respond_with invoice.customer
  end

end
