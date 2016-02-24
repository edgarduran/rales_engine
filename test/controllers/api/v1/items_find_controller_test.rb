require 'test_helper'

class Api::V1::ItemsFindControllerTest < ActionController::TestCase
  test "#index by name" do
    get :index, format: :json, name: Item.last.name

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, items.count
    assert_equal "Item_one", items.first['name']
    assert_equal "description_one", items.first['description']
    assert_equal "Item_one", items.last['name']
  end

  test "#index by description" do
    get :index, format: :json, description: Item.last.description

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, items.count
    assert_equal "Item_one", items.first['name']
    assert_equal "description_one", items.first['description']
    assert_equal "description_one", items.last['description']
  end

  test "#index by id" do
    get :index, format: :json, id: Item.first.id

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, items.count
    assert_equal "Item_two", items.first['name']
    assert_equal "description_two", items.first['description']
  end

  test "#show by name" do
    get :show, format: :json, name: Item.last.name

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Item_one", item['name']
    assert_equal "description_one", item['description']
  end

  test "#show by description" do
    get :show, format: :json, description: Item.last.description

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Item_one", item['name']
    assert_equal "description_one", item['description']
  end

  test "#show by id" do
    get :show, format: :json, id: Item.last.id

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Item_one", item['name']
    assert_equal "description_one", item['description']
  end

end
