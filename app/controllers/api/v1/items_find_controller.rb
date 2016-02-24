class Api::V1::ItemsFindController < ApplicationController
  respond_to :json

  def index
    if params["name"] || params["description"]
      respond_with Item.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Item.where("#{params.first.first}": params.first.last)
    end
  end

  def show
    if params["name"] || params["description"]
      respond_with Item.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Item.where("#{params.first.first}": params.first.last).first
    end
  end

end
