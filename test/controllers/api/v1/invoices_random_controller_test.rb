require 'test_helper'

class Api::V1::InvoicesRandomControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
  end

end
