require 'test_helper'

class DraftControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
    @gender = @player.gender
  end

  test "should get index" do
    get :index, gender: @gender
    assert_response :success
    assert_not_nil assigns(:gender)
    assert_not_nil assigns(:players)
  end

  test "should make pick" do
    # We start with an undrafted player and end up with a drafted one
    assert_nil Player.find(@player).team

    post :index, gender: @gender, player: @player

    assert_not_nil Player.find(@player).team
  end
end
