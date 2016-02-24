require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal "Merchant_one", merchants.first['name']
    assert_equal 2, merchants.count
  end

  test "#show" do
    get :show, format: :json, id: Merchant.last.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal "Merchant_one", merchant['name']
  end

end
