require 'test_helper'

class DraftTest < ActionDispatch::IntegrationTest
  setup do
    @good_next_pick = next_pick_numbers(:good)
    @bad_next_pick = next_pick_numbers(:too_high_number)
    @player = players(:male)
  end

  test "should make user chosen pick" do
    chosen_pick_number = @good_next_pick
    pick = Pick.get_pick(chosen_pick_number.gender, chosen_pick_number.number)
    # Set an arbitrary pick number
    post "/next_pick_numbers", gender: chosen_pick_number.gender, number: chosen_pick_number.number

    # Make the pick
    get_via_redirect "/draft#index", gender: chosen_pick_number.gender, player: @player.id

    # Make sure the pick went through
    assert_not_nil(Player.find(@player).team, "Player didn't get a team")
    Rails.logger.error("Pick: #{pick}, pick.player: #{pick.player}, Pick.find(pick).player: #{Pick.find(pick).player}")
    assert_not_nil(Pick.find(pick).player, "Pick didn't get a Player")

    # Destroy the pick number and undo the pick
    delete "/next_pick_numbers", id: chosen_pick_number
    put "/pick", id: pick
  end
end
