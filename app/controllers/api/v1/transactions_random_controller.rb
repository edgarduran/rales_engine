class Api::V1::TransactionsRandomController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.order("RANDOM()").first
  end

end
