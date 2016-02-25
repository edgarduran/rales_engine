require 'test_helper'

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, invoice_item_id: InvoiceItem.last.id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal "Paid", invoice['status']
  end
end
