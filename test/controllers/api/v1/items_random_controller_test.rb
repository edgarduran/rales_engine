require 'test_helper'

class Api::V1::ItemsRandomControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
