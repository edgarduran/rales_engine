require 'test_helper'

class Api::V1::Customers::FavoriteMerchantControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, customer_id: Customer.last.id

    merchant = JSON.parse(response.body)
  
    assert_response :success
    assert_equal "Merchant_one", merchant['name']
  end

end
