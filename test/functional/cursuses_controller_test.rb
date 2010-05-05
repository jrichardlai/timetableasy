require 'test_helper'

class CursusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cursuses" do
    assert_difference('Cursus.count') do
      post :create, :cursuses => { }
    end

    assert_redirected_to cursuses_path(assigns(:cursuses))
  end

  test "should show cursuses" do
    get :show, :id => cursuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cursuses(:one).to_param
    assert_response :success
  end

  test "should update cursuses" do
    put :update, :id => cursuses(:one).to_param, :cursuses => { }
    assert_redirected_to cursuses_path(assigns(:cursuses))
  end

  test "should destroy cursuses" do
    assert_difference('Cursus.count', -1) do
      delete :destroy, :id => cursuses(:one).to_param
    end

    assert_redirected_to cursuses_path
  end
end
