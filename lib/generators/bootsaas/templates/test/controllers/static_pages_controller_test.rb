require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get coming_soon" do
    get :coming_soon
    assert_response :success
  end

  test "should get pricing" do
    get :pricing
    assert_response :success
  end
end
