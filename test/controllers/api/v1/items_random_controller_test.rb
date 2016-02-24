require 'test_helper'

class Api::V1::ItemsRandomControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, item.class
  end
end
