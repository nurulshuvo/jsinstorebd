require 'test_helper'

class ThanasControllerTest < ActionController::TestCase
  setup do
    @thana = thanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thana" do
    assert_difference('Thana.count') do
      post :create, thana: { name: @thana.name }
    end

    assert_redirected_to thana_path(assigns(:thana))
  end

  test "should show thana" do
    get :show, id: @thana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thana
    assert_response :success
  end

  test "should update thana" do
    put :update, id: @thana, thana: { name: @thana.name }
    assert_redirected_to thana_path(assigns(:thana))
  end

  test "should destroy thana" do
    assert_difference('Thana.count', -1) do
      delete :destroy, id: @thana
    end

    assert_redirected_to thanas_path
  end
end
