require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get parent_login," do
    get :parent_login,
    assert_response :success
  end

  test "should get student_login," do
    get :student_login,
    assert_response :success
  end

  test "should get teacher_login" do
    get :teacher_login
    assert_response :success
  end

end
