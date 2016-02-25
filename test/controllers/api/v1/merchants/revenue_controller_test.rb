require 'test_helper'

class Api::V1::Merchants::RevenueControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, merchant_id: Merchant.first.id

    revenue = JSON.parse(response.body)

    assert_response :success
    assert_equal "0.0", revenue['revenue']
  end

end
