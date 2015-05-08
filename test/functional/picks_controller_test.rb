require 'test_helper'

class PicksControllerTest < ActionController::TestCase
  setup do
    @pick = picks(:one)
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:picks_by_gender)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pick" do
    assert_difference('Pick.count') do
      post :create, pick: { automatic: @pick.automatic, gender: @pick.gender, number: @pick.number }
    end

    assert_redirected_to pick_path(assigns(:pick))
  end

  test "should show pick" do
    get :show, id: @pick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pick
    assert_response :success
  end

  test "should update pick" do
    # We assign a player to the pick before we try to undo the pick
    @player.pick = @pick
    put :update, id: @pick
    assert_redirected_to picks_path
  end

  test "should destroy pick" do
    assert_difference('Pick.count', -1) do
      delete :destroy, id: @pick
    end

    assert_redirected_to picks_path
  end
end
