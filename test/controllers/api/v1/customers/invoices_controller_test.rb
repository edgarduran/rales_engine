require 'test_helper'

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, customer_id: Customer.last.id

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal "Paid", invoices.first['status']
    assert_equal "Pending", invoices.last['status']
  end

end
