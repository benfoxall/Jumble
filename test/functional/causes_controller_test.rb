require 'test_helper'

class CausesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:causes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cause" do
    assert_difference('Cause.count') do
      post :create, :cause => { }
    end

    assert_redirected_to cause_path(assigns(:cause))
  end

  test "should show cause" do
    get :show, :id => causes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => causes(:one).to_param
    assert_response :success
  end

  test "should update cause" do
    put :update, :id => causes(:one).to_param, :cause => { }
    assert_redirected_to cause_path(assigns(:cause))
  end

  test "should destroy cause" do
    assert_difference('Cause.count', -1) do
      delete :destroy, :id => causes(:one).to_param
    end

    assert_redirected_to causes_path
  end
end
