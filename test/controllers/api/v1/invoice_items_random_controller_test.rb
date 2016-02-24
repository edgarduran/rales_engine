require 'test_helper'

class Api::V1::InvoiceItemsRandomControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice_item.class
  end

end
