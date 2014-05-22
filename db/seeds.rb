# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

players_filename = "#{Rails.root}/lib/assets/players.csv"
num_players = 0
CSV.foreach(players_filename, :headers => :first_row) do |player|
  p = Player.create(:first_name => player['first'], :last_name => player['last'],
                    :age => player['age'], :gender => player['gender'],
                    :ripul_id_number => player['PlayerID'])
  p.save
  num_players += 1
end
puts "processed #{num_players} players"
puts "processed #{Player.undrafted('M').count} male players and #{Player.undrafted('F').count} female players"

picks_filename = "#{Rails.root}/lib/assets/picks.csv"
num_male_picks = 0
num_female_picks = 0
CSV.foreach(picks_filename, :headers => :first_row) do |pick|
  pick_number = -1
  if pick['gender'] == "M"
    num_male_picks += 1
    pick_number = num_male_picks
  elsif pick['gender'] == "F"
    num_female_picks += 1
    pick_number = num_female_picks
  else
    puts "error processing gender of pick #{pick}"
  end
  new_pick = Pick.create(:gender => pick['gender'], :number => pick_number)
  new_pick.team = Team.find_by_color(pick['color'])
  new_pick.save
end
puts "processed #{num_male_picks} male picks and #{num_female_picks} female picks"
