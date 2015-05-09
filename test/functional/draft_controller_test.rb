require 'test_helper'

class DraftControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
    @gender = @player.gender
  end

  test "should get index" do
    get :index, gender: @gender
    assert_response :success
    assert_not_nil assigns(:gender), "Gender isn't set"
    assert_not_nil assigns(:players), "Players aren't set"
  end

  test "should make next pick" do
    # The next pick (in order) should start with no player but end up with one.
    our_pick = Pick.next_undrafted(@player.gender)
    assert_nil our_pick.player, "Pick already has a Player"

    # We start with an undrafted player and end up with a drafted one
    assert_nil Player.find(@player).team, "Player already has a team"
    post :index, gender: @gender, player: @player
    assert_not_nil Player.find(@player).team, "Player didn't get a team"

    assert_not_nil Pick.find(our_pick).player, "Pick didn't get a Player"
  end
end
