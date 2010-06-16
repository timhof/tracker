require 'test_helper'

class SpecsStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specs_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specs_status" do
    assert_difference('SpecsStatus.count') do
      post :create, :specs_status => { }
    end

    assert_redirected_to specs_status_path(assigns(:specs_status))
  end

  test "should show specs_status" do
    get :show, :id => specs_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => specs_statuses(:one).to_param
    assert_response :success
  end

  test "should update specs_status" do
    put :update, :id => specs_statuses(:one).to_param, :specs_status => { }
    assert_redirected_to specs_status_path(assigns(:specs_status))
  end

  test "should destroy specs_status" do
    assert_difference('SpecsStatus.count', -1) do
      delete :destroy, :id => specs_statuses(:one).to_param
    end

    assert_redirected_to specs_statuses_path
  end
end
