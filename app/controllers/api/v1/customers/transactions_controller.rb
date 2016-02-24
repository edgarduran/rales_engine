class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    customer = Customer.find(params[:customer_id])
    respond_with customer.transactions
  end

end
