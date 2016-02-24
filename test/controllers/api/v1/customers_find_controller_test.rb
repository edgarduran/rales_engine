require 'test_helper'

class Api::V1::CustomersFindControllerTest < ActionController::TestCase
  test "#index by first_name" do
    get :index, format: :json, first_name: Customer.last.first_name

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal "Customer_one", customers.first['first_name']
    assert_equal "Customer_one", customers.last['first_name']
  end

  test "#index by last_name" do
    get :index, format: :json, last_name: Customer.last.last_name

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal "Last_one", customers.first['last_name']
    assert_equal "Last_one", customers.last['last_name']
  end

  test "#index by id" do
    get :index, format: :json, id: Customer.last.id

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, customers.count
    assert_equal "Customer_one", customers.first['first_name']
  end

  test "#show by first_name" do
    get :show, format: :json, first_name: Customer.last.first_name

    customer = JSON.parse(response.body)

    assert_equal "Customer_one", customer['first_name']
    assert_response :success
  end

  test "#show by last_name" do
    get :show, format: :json, last_name: Customer.last.last_name

    customer = JSON.parse(response.body)

    assert_equal "Last_one", customer['last_name']
    assert_response :success
  end

  test "#show by id" do
    get :show, format: :json, id: Customer.last.id

    customer = JSON.parse(response.body)

    assert_equal "Customer_one", customer['first_name']
    assert_response :success
  end

end
