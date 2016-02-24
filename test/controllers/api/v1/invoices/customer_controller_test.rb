require 'test_helper'

class Api::V1::Invoices::CustomersControllerTest < ActionController::TestCase
  test "#show" do
    skip
    get :show, format: :json, invoice_id: Invoice.first.id

    customer = JSON.parse(response.body)

    assert_response :success
  end

end
