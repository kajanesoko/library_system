require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add_item" do
    get :add_item
    assert_response :success
  end

end
