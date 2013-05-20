class Player < ActiveRecord::Base
  belongs_to :team
  attr_accessible :age, :first_name, :gender, :last_name
  def name
    return self.first_name + " " + self.last_name
  end
end
