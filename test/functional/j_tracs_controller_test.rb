require 'test_helper'

class JTracsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:j_tracs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create j_trac" do
    assert_difference('JTrac.count') do
      post :create, :j_trac => { }
    end

    assert_redirected_to j_trac_path(assigns(:j_trac))
  end

  test "should show j_trac" do
    get :show, :id => j_tracs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => j_tracs(:one).to_param
    assert_response :success
  end

  test "should update j_trac" do
    put :update, :id => j_tracs(:one).to_param, :j_trac => { }
    assert_redirected_to j_trac_path(assigns(:j_trac))
  end

  test "should destroy j_trac" do
    assert_difference('JTrac.count', -1) do
      delete :destroy, :id => j_tracs(:one).to_param
    end

    assert_redirected_to j_tracs_path
  end
end
