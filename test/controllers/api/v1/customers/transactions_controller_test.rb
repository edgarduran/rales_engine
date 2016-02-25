require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, customer_id: Customer.last.id

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal "success", transactions.first['result']
    assert_equal "failed", transactions.last['result']
  end

end
