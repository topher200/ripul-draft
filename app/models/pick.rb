class Pick < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  attr_accessible :automatic, :gender, :number

  def males
    return Pick.where("gender = M")
  def females
    return Pick.where("gender = F")
end
