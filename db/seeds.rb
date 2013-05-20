# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

players_filename = "#{Rails.root}/lib/assets/ripul.csv"
CSV.foreach(players_filename, :headers => :first_row) do |player|
  puts "processing #{player['first']} #{player['last']}"
  p = Player.create(:first_name => player['first'], :last_name => player['last'],
                    :age => player['age'], :gender => player['gender'])
  p.save
end
