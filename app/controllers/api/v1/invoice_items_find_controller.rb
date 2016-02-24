class Api::V1::InvoiceItemsFindController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.where("#{params.first.first}": params.first.last)
  end

  def show
    respond_with InvoiceItem.where("#{params.first.first}": params.first.last).first
  end
end
