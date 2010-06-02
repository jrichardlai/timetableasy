require 'test_helper'

class TeachingMethodsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teaching_methods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teaching_method" do
    assert_difference('TeachingMethod.count') do
      post :create, :teaching_method => { }
    end

    assert_redirected_to teaching_method_path(assigns(:teaching_method))
  end

  test "should show teaching_method" do
    get :show, :id => teaching_methods(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => teaching_methods(:one).to_param
    assert_response :success
  end

  test "should update teaching_method" do
    put :update, :id => teaching_methods(:one).to_param, :teaching_method => { }
    assert_redirected_to teaching_method_path(assigns(:teaching_method))
  end

  test "should destroy teaching_method" do
    assert_difference('TeachingMethod.count', -1) do
      delete :destroy, :id => teaching_methods(:one).to_param
    end

    assert_redirected_to teaching_methods_path
  end
end
