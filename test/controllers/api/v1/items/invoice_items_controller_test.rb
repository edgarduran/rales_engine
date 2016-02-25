require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, item_id: Item.last.id

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoice_items.count
    assert_equal 1, invoice_items.first['unit_price']
  end
end
