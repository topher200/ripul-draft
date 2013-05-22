class Pick < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  attr_accessible :automatic, :gender, :number

  def self.males
    return find_all_by_gender "M"
  end
  def self.females
    return find_all_by_gender "F"
  end

  def self.next_pick
    return Pick.where("player_id IS NULL").order("gender DESC").order("number").limit(1).first
  end

  def gender_to_string
    if gender == "F"
      return "Female"
    else
      return "Male"
    end
  end
end
