require 'test_helper'

class BaggagesControllerTest < ActionController::TestCase
  setup do
    @baggage = baggages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baggages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baggage" do
    assert_difference('Baggage.count') do
      post :create, baggage: { pick_to_lose: @baggage.pick_to_lose }
    end

    assert_redirected_to baggage_path(assigns(:baggage))
  end

  test "should show baggage" do
    get :show, id: @baggage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baggage
    assert_response :success
  end

  test "should update baggage" do
    put :update, id: @baggage, baggage: { pick_to_lose: @baggage.pick_to_lose }
    assert_redirected_to baggage_path(assigns(:baggage))
  end

  test "should destroy baggage" do
    assert_difference('Baggage.count', -1) do
      delete :destroy, id: @baggage
    end

    assert_redirected_to baggages_path
  end
end
