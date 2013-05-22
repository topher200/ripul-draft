class Baggage < ActiveRecord::Base
  belongs_to :player_one, :class_name => "Player"
  belongs_to :player_two, :class_name => "Player"
  attr_accessible :pick_to_lose

  def other_player_in_baggage(player)
    if player == self.player_one
      return self.player_two
    else
      return self.player_one
    end
  end

  def self.baggage_involving_player(player)
    Baggage.where("player_one = ? OR player_two = ?", player, player)
  end

  def self.baggage_involving_player_string(player)
    baggage = Baggage.baggage_involving_player(player)
    return [baggage.player_one, baggage.player_two].join(" and ")
  end
end
