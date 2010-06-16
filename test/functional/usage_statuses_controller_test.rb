require 'test_helper'

class UsageStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usage_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usage_status" do
    assert_difference('UsageStatus.count') do
      post :create, :usage_status => { }
    end

    assert_redirected_to usage_status_path(assigns(:usage_status))
  end

  test "should show usage_status" do
    get :show, :id => usage_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => usage_statuses(:one).to_param
    assert_response :success
  end

  test "should update usage_status" do
    put :update, :id => usage_statuses(:one).to_param, :usage_status => { }
    assert_redirected_to usage_status_path(assigns(:usage_status))
  end

  test "should destroy usage_status" do
    assert_difference('UsageStatus.count', -1) do
      delete :destroy, :id => usage_statuses(:one).to_param
    end

    assert_redirected_to usage_statuses_path
  end
end
