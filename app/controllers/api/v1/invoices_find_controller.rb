class Api::V1::InvoicesFindController < ApplicationController
  respond_to :json

  def index
    if params["status"]
      respond_with Invoice.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Invoice.where("#{params.first.first}": params.first.last)
    end
  end

  def show
    if params['status']
      respond_with Invoice.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Invoice.where("#{params.first.first}": params.first.last).first
    end
  end

end
