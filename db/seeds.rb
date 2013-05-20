# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

players_filename = "#{Rails.root}/lib/assets/ripul.csv"
num_players = 0
CSV.foreach(players_filename, :headers => :first_row) do |player|
  p = Player.create(:first_name => player['first'], :last_name => player['last'],
                    :age => player['age'], :gender => player['gender'])
  p.save
  num_players += 1
end
puts "processed #{num_players} players"

teams_filename = "#{Rails.root}/lib/assets/teams.csv"
num_teams = 0
CSV.foreach(teams_filename, :headers => :first_row) do |team|
  # Create the new team
  new_team = Team.create(:color => team['color'])
  num_teams += 1

  # add each captain to the new team
  ['captain1', 'captain2'].each do |captain|
    first_name, last_name = team[captain].split(' ', 2)
    player_list = Player.where(:first_name => first_name, :last_name => last_name)
    if player_list.length != 1
      puts "error processing captain #{first_name} #{last_name}"
    end
    player = player_list.first
    player.team = new_team
    player.save
  end
end
puts "processed #{num_teams} teams"
