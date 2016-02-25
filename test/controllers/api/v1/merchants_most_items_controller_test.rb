require 'test_helper'

class Api::V1::MerchantsMostItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, quantity: 1
    assert_response :success
  end
end
