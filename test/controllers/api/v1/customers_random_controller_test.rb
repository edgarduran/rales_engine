require 'test_helper'

class Api::V1::CustomersRandomControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, customer.class
  end

end
