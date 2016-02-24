require 'test_helper'

class Api::V1::MerchantsFindControllerTest < ActionController::TestCase
  test "#index by name" do
    get :index, format: :json, name: Merchant.last.name

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, merchants.count
    assert_equal "Merchant_one", merchants.first['name']
    assert_equal "Merchant_one", merchants.last['name']
  end

  test "#index by id" do
    get :index, format: :json, id: Merchant.last.id

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchants.count
    assert_equal "Merchant_one", merchants.first['name']
  end

  test "#show by name" do
    get :show, format: :json, name: Merchant.last.name

    merchant = JSON.parse(response.body)

    assert_equal "Merchant_one", merchant['name']
    assert_response :success
  end

  test "#show by id" do
    get :show, format: :json, id: Merchant.last.id

    merchant = JSON.parse(response.body)

    assert_equal "Merchant_one", merchant['name']
    assert_response :success
  end

end
