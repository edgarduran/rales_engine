class Api::V1::TransactionsFindController < ApplicationController
  respond_to :json

  def index
    if params["credit_card_number"] || params["result"]
      respond_with Transaction.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Transaction.where("#{params.first.first}": params.first.last)
    end
  end

  def show
    if params["credit_card_number"] || params["result"]
      respond_with Transaction.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Transaction.where("#{params.first.first}": params.first.last).first
    end
  end

end
