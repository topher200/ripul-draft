class Baggage < ActiveRecord::Base
  belongs_to :player_one
  belongs_to :player_two
  attr_accessible :pick_to_lose
end
