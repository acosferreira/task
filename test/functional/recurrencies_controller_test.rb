require 'test_helper'

class RecurrenciesControllerTest < ActionController::TestCase
  setup do
    @recurrency = recurrencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurrencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurrency" do
    assert_difference('Recurrency.count') do
      post :create, recurrency: { name: @recurrency.name }
    end

    assert_redirected_to recurrency_path(assigns(:recurrency))
  end

  test "should show recurrency" do
    get :show, id: @recurrency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recurrency
    assert_response :success
  end

  test "should update recurrency" do
    put :update, id: @recurrency, recurrency: { name: @recurrency.name }
    assert_redirected_to recurrency_path(assigns(:recurrency))
  end

  test "should destroy recurrency" do
    assert_difference('Recurrency.count', -1) do
      delete :destroy, id: @recurrency
    end

    assert_redirected_to recurrencies_path
  end
end
