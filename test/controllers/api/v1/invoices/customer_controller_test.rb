require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, invoice_id: Invoice.first.id

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal "Customer_one", customer['first_name']
    assert_equal "Last_one", customer['last_name']
  end

end
