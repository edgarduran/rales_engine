require 'test_helper'

class Api::V1::Transactions::InvoiceControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, format: :json, transaction_id: Transaction.last.id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal "Paid", invoice['status']
  end

end
