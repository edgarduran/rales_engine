require 'test_helper'

class Api::V1::InvoiceItemsFindControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, id: InvoiceItem.first.id

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, invoice_items.first['quantity']
    assert_equal 2, invoice_items.first['unit_price']
  end

  test "#show" do
    get :show, format: :json, id: InvoiceItem.last.id

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoice_item['quantity']
    assert_equal 1, invoice_item['unit_price']
  end

end
