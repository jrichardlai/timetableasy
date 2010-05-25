require 'test_helper'

class SchoolSubjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_subject" do
    assert_difference('SchoolSubject.count') do
      post :create, :school_subject => { }
    end

    assert_redirected_to school_subject_path(assigns(:school_subject))
  end

  test "should show school_subject" do
    get :show, :id => school_subjects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => school_subjects(:one).to_param
    assert_response :success
  end

  test "should update school_subject" do
    put :update, :id => school_subjects(:one).to_param, :school_subject => { }
    assert_redirected_to school_subject_path(assigns(:school_subject))
  end

  test "should destroy school_subject" do
    assert_difference('SchoolSubject.count', -1) do
      delete :destroy, :id => school_subjects(:one).to_param
    end

    assert_redirected_to school_subjects_path
  end
end
