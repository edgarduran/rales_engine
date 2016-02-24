require 'test_helper'

class Api::V1::InvoicesFindControllerTest < ActionController::TestCase
  test "#index by status" do
    get :index, format: :json, status: Invoice.last.status

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal "Paid", invoices.first['status']
    assert_equal "Paid", invoices.last['status']
  end

  test "#index by id" do
    get :index, format: :json, id: Invoice.last.id

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoices.count
    assert_equal "Paid", invoices.first['status']
  end

  test "#show by status" do
    get :show, format: :json, status: Invoice.last.status

    invoice = JSON.parse(response.body)

    assert_equal "Paid", invoice['status']
    assert_response :success
  end

  test "#show by id" do
    get :show, format: :json, id: Invoice.last.id

    invoice = JSON.parse(response.body)

    assert_equal "Paid", invoice['status']
    assert_response :success
  end

end
