class Baggage < ActiveRecord::Base
  belongs_to :player1
  belongs_to :player2
  attr_accessible :pick_to_lose
end
