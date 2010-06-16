require 'test_helper'

class BugStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_status" do
    assert_difference('BugStatus.count') do
      post :create, :bug_status => { }
    end

    assert_redirected_to bug_status_path(assigns(:bug_status))
  end

  test "should show bug_status" do
    get :show, :id => bug_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bug_statuses(:one).to_param
    assert_response :success
  end

  test "should update bug_status" do
    put :update, :id => bug_statuses(:one).to_param, :bug_status => { }
    assert_redirected_to bug_status_path(assigns(:bug_status))
  end

  test "should destroy bug_status" do
    assert_difference('BugStatus.count', -1) do
      delete :destroy, :id => bug_statuses(:one).to_param
    end

    assert_redirected_to bug_statuses_path
  end
end
