class Player < ActiveRecord::Base
  belongs_to :team
  attr_accessible :age, :first_name, :gender, :last_name
end
