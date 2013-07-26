require 'test_helper'

class TypeTasksControllerTest < ActionController::TestCase
  setup do
    @type_task = type_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_task" do
    assert_difference('TypeTask.count') do
      post :create, type_task: { name: @type_task.name }
    end

    assert_redirected_to type_task_path(assigns(:type_task))
  end

  test "should show type_task" do
    get :show, id: @type_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_task
    assert_response :success
  end

  test "should update type_task" do
    put :update, id: @type_task, type_task: { name: @type_task.name }
    assert_redirected_to type_task_path(assigns(:type_task))
  end

  test "should destroy type_task" do
    assert_difference('TypeTask.count', -1) do
      delete :destroy, id: @type_task
    end

    assert_redirected_to type_tasks_path
  end
end
