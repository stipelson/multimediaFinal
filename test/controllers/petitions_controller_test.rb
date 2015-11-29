require 'test_helper'

class PetitionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get indexuser" do
    get :indexuser
    assert_response :success
  end

end
