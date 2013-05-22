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
end
