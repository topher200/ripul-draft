class Player < ActiveRecord::Base
  belongs_to :team
  has_many :baggages
  has_one :pick
  attr_accessible :age, :first_name, :gender, :last_name, :ripul_id_number

  def name
    return self.first_name + " " + self.last_name
  end

  def self.find_by_name(name)
    first_name, last_name = name.split
    return Player.where("first_name = ? AND last_name = ?", first_name, last_name).first
  end
    
  def self.undrafted(gender)
    return Player.where("team_id IS NULL AND gender = ?", gender)
  end
end
