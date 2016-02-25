require 'test_helper'

class Api::V1::Invoices::MerchantControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, invoice_id: Invoice.last.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal "Merchant_one", merchant['name']
  end

end
