require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal "Paid", invoices.first['status']
    assert_equal 2, invoices.count
  end

  test "#show" do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal "Pending", invoice['status']
  end

end
