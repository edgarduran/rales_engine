require 'test_helper'

class Api::V1::Merchants::FavoriteCustomerControllerTest < ActionController::TestCase
  test "#show" do
    skip
    get :show, format: :json, merchant_id: Merchant.last.id

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, customer['unit_price']
    assert_equal 2, customer['unit_price']
  end

end
