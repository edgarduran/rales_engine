require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, invoice_id: Invoice.last.id

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, items.count
    assert_equal "Item_one", items.first['name']
    assert_equal "1.0", items.first['unit_price']
    assert_equal 'Item_two', items.last['name']
    assert_equal "description_two", items.last['description']
  end

end
