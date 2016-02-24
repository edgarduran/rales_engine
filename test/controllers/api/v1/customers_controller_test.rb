require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    customers = JSON.parse(response.body)

    assert_equal "Customer_one", customers.first['first_name']
    assert_equal "Last_one", customers.first['last_name']
    assert_equal "Customer_two", customers.last['first_name']
    assert_equal "Last_two", customers.last['last_name']
    assert_equal 2, customers.count
    assert_response :success
  end

  test "#show" do
    get :show, format: :json, id: Customer.last.id

    customer = JSON.parse(response.body)

    assert_equal "Customer_one", customer['first_name']
    assert_equal "Last_one", customer['last_name']
    assert_response :success
  end

end
