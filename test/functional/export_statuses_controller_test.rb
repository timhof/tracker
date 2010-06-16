require 'test_helper'

class ExportStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:export_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create export_status" do
    assert_difference('ExportStatus.count') do
      post :create, :export_status => { }
    end

    assert_redirected_to export_status_path(assigns(:export_status))
  end

  test "should show export_status" do
    get :show, :id => export_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => export_statuses(:one).to_param
    assert_response :success
  end

  test "should update export_status" do
    put :update, :id => export_statuses(:one).to_param, :export_status => { }
    assert_redirected_to export_status_path(assigns(:export_status))
  end

  test "should destroy export_status" do
    assert_difference('ExportStatus.count', -1) do
      delete :destroy, :id => export_statuses(:one).to_param
    end

    assert_redirected_to export_statuses_path
  end
end
