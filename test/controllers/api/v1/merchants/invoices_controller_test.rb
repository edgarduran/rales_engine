require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, merchant_id: Merchant.first.id

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal "Paid", invoices.first['status']
    assert_equal "Pending", invoices.last['status']
  end
end
