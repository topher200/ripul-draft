class Pick < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  attr_accessible :automatic, :gender, :number, :team_id

  def self.males
    return self.find_all_by_gender "M"
  end
  def self.females
    return self.find_all_by_gender "F"
  end

  def self.next_undrafted(gender_char)
    return Pick.where(
                      "player_id IS NULL and gender = ?",
                      gender_char)
      .order("number").first
  end

  def self.get_pick(gender, number)
    return Pick.where("gender = ? and number = ?", gender, number).first
  end

  def gender_to_string
    if gender == "F"
      return "Female"
    else
      return "Male"
    end
  end
end
