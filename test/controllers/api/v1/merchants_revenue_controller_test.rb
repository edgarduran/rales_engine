require 'test_helper'

class Api::V1::MerchantsRevenueControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#show" do
    get :show, format: :json, date: "2012-03-07 10:54:55"

    revenue = JSON.parse(response.body)

    assert_response :success
  end
end
