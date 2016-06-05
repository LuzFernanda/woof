require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

  test "should get perrosperdidos" do
    get :perrosperdidos
    assert_response :success
  end

  test "should get perrosencontrados" do
    get :perrosencontrados
    assert_response :success
  end

end
