class Api::V1::CustomersFindController < ApplicationController
  respond_to :json

  def index
    if params["name"]
      respond_with Customer.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Customer.where("#{params.first.first}": params.first.last)
    end
  end

  def show
    if params["first_name"] || params["last_name"]
      respond_with Customer.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Customer.where("#{params.first.first}": params.first.last).first
    end
  end
end
