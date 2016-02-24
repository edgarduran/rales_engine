require 'test_helper'

class Api::V1::MerchantsRandomControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
