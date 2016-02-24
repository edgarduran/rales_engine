require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal "Item_one", items.first['name']
    assert_equal "description_one", items.first['description']
    assert_equal 1, items.first['unit_price']
    assert_equal 2, items.count
  end

  test "#show" do
    get :show, format: :json, id: Item.last.id

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Item_one", item['name']
    assert_equal "description_one", item['description']
    assert_equal 1, item['unit_price']
  end

end
