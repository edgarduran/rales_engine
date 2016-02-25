require 'test_helper'

class Api::V1::Customers::FavoriteMerchantControllerTest < ActionController::TestCase
  test "#show" do
    skip
    get :show, format: :json, customer_id: Customer.last.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchant['unit_price']
    assert_equal 2, merchant['unit_price']
  end

end
