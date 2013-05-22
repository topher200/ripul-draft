class Baggage < ActiveRecord::Base
  belongs_to :player_one, :class_name => "Player"
  belongs_to :player_two, :class_name => "Player"
  attr_accessible :pick_to_lose
end
