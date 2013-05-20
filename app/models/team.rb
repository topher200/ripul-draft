class Team < ActiveRecord::Base
  attr_accessible :color
  has_many :players
end
