require 'test_helper'

class TestStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_status" do
    assert_difference('TestStatus.count') do
      post :create, :test_status => { }
    end

    assert_redirected_to test_status_path(assigns(:test_status))
  end

  test "should show test_status" do
    get :show, :id => test_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test_statuses(:one).to_param
    assert_response :success
  end

  test "should update test_status" do
    put :update, :id => test_statuses(:one).to_param, :test_status => { }
    assert_redirected_to test_status_path(assigns(:test_status))
  end

  test "should destroy test_status" do
    assert_difference('TestStatus.count', -1) do
      delete :destroy, :id => test_statuses(:one).to_param
    end

    assert_redirected_to test_statuses_path
  end
end
