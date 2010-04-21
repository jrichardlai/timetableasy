require 'test_helper'

class PeriodTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:period_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period_type" do
    assert_difference('PeriodType.count') do
      post :create, :period_type => { }
    end

    assert_redirected_to period_type_path(assigns(:period_type))
  end

  test "should show period_type" do
    get :show, :id => period_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => period_types(:one).to_param
    assert_response :success
  end

  test "should update period_type" do
    put :update, :id => period_types(:one).to_param, :period_type => { }
    assert_redirected_to period_type_path(assigns(:period_type))
  end

  test "should destroy period_type" do
    assert_difference('PeriodType.count', -1) do
      delete :destroy, :id => period_types(:one).to_param
    end

    assert_redirected_to period_types_path
  end
end
