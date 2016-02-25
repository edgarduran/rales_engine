require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, invoice_id: Invoice.last.id

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal "1234567890987654", transactions.first['credit_card_number']
    assert_equal "success", transactions.first['result']
    assert_equal '1234567890987654', transactions.last['credit_card_number']
    assert_equal "failed", transactions.last['result']
  end

end
