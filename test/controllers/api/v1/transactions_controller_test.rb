require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal "1234567890987654", transactions.first['credit_card_number']
    assert_equal "success", transactions.first['result']
    assert_equal 4, transactions.count
  end

  test "#show" do
    get :show, format: :json, id: Transaction.last.id

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal "1234567890987654", transaction['credit_card_number']
    assert_equal "success", transaction['result']
  end
end
