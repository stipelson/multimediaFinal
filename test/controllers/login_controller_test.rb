require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get iniciar_sesion" do
    get :iniciar_sesion
    assert_response :success
  end

  test "should get cerrar_sesion" do
    get :cerrar_sesion
    assert_response :success
  end

end
