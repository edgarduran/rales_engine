require 'test_helper'

class Api::V1::TransactionsFindControllerTest < ActionController::TestCase
  test "#index by result" do
    get :index, format: :json, result: Transaction.last.result

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal "1234567890987654", transactions.first['credit_card_number']
    assert_equal "success", transactions.first['result']
    assert_equal "1234567890980000", transactions.last['credit_card_number']
    assert_equal "success", transactions.last['result']
  end

  test "#index by credit_card_number" do
    get :index, format: :json, credit_card_number: Transaction.last.credit_card_number

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal "1234567890987654", transactions.first['credit_card_number']
    assert_equal "success", transactions.first['result']
    assert_equal "1234567890980000", transactions.last['credit_card_number']
    assert_equal "success", transactions.last['result']
  end

  test "#index by id" do
    skip
    get :index, format: :json, id: Transaction.last.id

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, transactions.count
    assert_equal "1234567890987654", transactions.first['credit_card_number']
    assert_equal "success", transactions.first['result']
  end

  test "#show by name" do
    skip
    get :show, format: :json, name: Transaction.last.name

    transaction = JSON.parse(response.body)

    assert_equal "Transaction_one", transaction['name']
    assert_response :success
  end

  test "#show by credit_card_number" do
    skip
    get :show, format: :json, credit_card_number: Transaction.last.credit_card_number

    transaction = JSON.parse(response.body)

    assert_equal "Transaction_one", transaction['name']
    assert_response :success
  end

  test "#show by id" do
    skip
    get :show, format: :json, id: Transaction.last.id

    transaction = JSON.parse(response.body)

    assert_equal "Transaction_one", transaction['name']
    assert_response :success
  end

end
