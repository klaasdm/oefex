require 'test_helper'

class ShowRoomsControllerTest < ActionController::TestCase
  setup do
    @show_room = show_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:show_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show_room" do
    assert_difference('ShowRoom.count') do
      post :create, :show_room => @show_room.attributes
    end

    assert_redirected_to show_room_path(assigns(:show_room))
  end

  test "should show show_room" do
    get :show, :id => @show_room.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @show_room.to_param
    assert_response :success
  end

  test "should update show_room" do
    put :update, :id => @show_room.to_param, :show_room => @show_room.attributes
    assert_redirected_to show_room_path(assigns(:show_room))
  end

  test "should destroy show_room" do
    assert_difference('ShowRoom.count', -1) do
      delete :destroy, :id => @show_room.to_param
    end

    assert_redirected_to show_rooms_path
  end
end
