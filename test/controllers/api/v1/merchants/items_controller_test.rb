require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, merchant_id: Merchant.first.id

    items = JSON.parse(response.body)
    
    assert_response :success
    assert_equal 2, items.count
    assert_equal "Item_two", items.last['name']
    assert_equal "description_two", items.last['description']
    assert_equal "Item_one", items.first['name']
  end

end
