require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal "1.0", invoice_items.first['unit_price']
    assert_equal 1, invoice_items.first['quantity']
    assert_equal 2, invoice_items.count
  end

  test "#show" do
    get :show, format: :json, id: InvoiceItem.last.id

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal "1.0", invoice_item['unit_price']
    assert_equal 1, invoice_item['quantity']
  end
end
