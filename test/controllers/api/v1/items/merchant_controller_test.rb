require 'test_helper'

class Api::V1::Items::MerchantControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, item_id: Item.last.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal "Merchant_one", merchant['name']
  end
end
