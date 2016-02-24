require 'test_helper'

class Api::V1::MerchantsRandomControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, merchant.class
  end
end
