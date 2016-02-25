require 'test_helper'

class Api::V1::Merchants::CustomersWithPendingInvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json, merchant_id: Merchant.last.id

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 0, items.count
  end
end
