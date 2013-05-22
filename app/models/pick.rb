class Pick < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  attr_accessible :automatic, :gender, :number
end
