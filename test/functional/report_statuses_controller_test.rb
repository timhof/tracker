require 'test_helper'

class ReportStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_status" do
    assert_difference('ReportStatus.count') do
      post :create, :report_status => { }
    end

    assert_redirected_to report_status_path(assigns(:report_status))
  end

  test "should show report_status" do
    get :show, :id => report_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => report_statuses(:one).to_param
    assert_response :success
  end

  test "should update report_status" do
    put :update, :id => report_statuses(:one).to_param, :report_status => { }
    assert_redirected_to report_status_path(assigns(:report_status))
  end

  test "should destroy report_status" do
    assert_difference('ReportStatus.count', -1) do
      delete :destroy, :id => report_statuses(:one).to_param
    end

    assert_redirected_to report_statuses_path
  end
end
