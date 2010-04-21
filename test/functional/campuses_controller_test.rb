require 'test_helper'

class CampusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campuses" do
    assert_difference('Campuses.count') do
      post :create, :campuses => { }
    end

    assert_redirected_to campuses_path(assigns(:campuses))
  end

  test "should show campuses" do
    get :show, :id => campuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => campuses(:one).to_param
    assert_response :success
  end

  test "should update campuses" do
    put :update, :id => campuses(:one).to_param, :campuses => { }
    assert_redirected_to campuses_path(assigns(:campuses))
  end

  test "should destroy campuses" do
    assert_difference('Campuses.count', -1) do
      delete :destroy, :id => campuses(:one).to_param
    end

    assert_redirected_to campuses_path
  end
end
