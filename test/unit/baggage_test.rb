require 'test_helper'

class BaggageTest < ActiveSupport::TestCase
  test "other_player_in_baggage is correct" do
    assert baggages(:one).other_player_in_baggage(baggages(:one).player_one) == baggages(:one).player_two
    assert baggages(:one).other_player_in_baggage(baggages(:one).player_two) == baggages(:one).player_one
  end
end
