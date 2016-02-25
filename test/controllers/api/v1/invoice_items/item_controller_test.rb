require 'test_helper'

class Api::V1::InvoiceItems::ItemControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, invoice_item_id: InvoiceItem.last.id

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Item_one", item['name']
    assert_equal "description_one", item['description']
  end
end
