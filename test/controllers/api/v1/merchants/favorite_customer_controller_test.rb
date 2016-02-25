require 'test_helper'

class Api::V1::Merchants::FavoriteCustomerControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, merchant_id: Merchant.first.id

    customer = JSON.parse(response.body)
    
    assert_response :success
    assert_equal "Customer_two", customer['first_name']
    assert_equal "Last_two", customer['last_name']
  end

end
