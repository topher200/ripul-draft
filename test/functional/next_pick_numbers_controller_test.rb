require 'test_helper'

class NextPickNumbersControllerTest < ActionController::TestCase
  setup do
    @next_pick_number = next_pick_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:next_pick_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create next_pick_number" do
    assert_difference('NextPickNumber.count') do
      post :create, next_pick_number: { gender: @next_pick_number.gender, number: @next_pick_number.number }
    end

    assert_redirected_to next_pick_number_path(assigns(:next_pick_number))
  end

  test "should show next_pick_number" do
    get :show, id: @next_pick_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @next_pick_number
    assert_response :success
  end

  test "should update next_pick_number" do
    put :update, id: @next_pick_number, next_pick_number: { gender: @next_pick_number.gender, number: @next_pick_number.number }
    assert_redirected_to next_pick_number_path(assigns(:next_pick_number))
  end

  test "should destroy next_pick_number" do
    assert_difference('NextPickNumber.count', -1) do
      delete :destroy, id: @next_pick_number
    end

    assert_redirected_to next_pick_numbers_path
  end
end
