require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, invoice_id: Invoice.last.id

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoice_items.count
    assert_equal 1, invoice_items.first['unit_price']
    assert_equal 2, invoice_items.last['unit_price']
  end

end
