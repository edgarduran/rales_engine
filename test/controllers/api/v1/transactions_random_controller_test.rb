require 'test_helper'

class Api::V1::TransactionsRandomControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, transaction.class
  end

end
