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
                    :age => player['age'], :gender => player['gender'],
                    :ripul_id_number => player['id'])
  p.save
  num_players += 1
end
puts "processed #{num_players} players"
puts "processed #{Player.undrafted('M').count} male players and #{Player.undrafted('F').count} female players"

teams_filename = "#{Rails.root}/lib/assets/teams.csv"
CSV.foreach(teams_filename, :headers => :first_row) do |team|
  # Create the new team
  new_team = Team.create(:color => team['color'])

  # add each captain to the new team
  ['captain1', 'captain2'].each do |captain|
    if team[captain] == nil
      puts "skipping blank captain #{captain} for #{team['color']}"
      next
    end
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
puts "processed #{Team.all.count} teams"

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

baggages_filename = "#{Rails.root}/lib/assets/baggages.csv"
num_baggages = 0
CSV.foreach(baggages_filename, :headers => :first_row) do |baggage|
  new_baggage = Baggage.create(:pick_to_lose => baggage['pick_to_lose'])
  new_baggage.player_one = Player.find_by_name(baggage['player1'])
  new_baggage.player_two = Player.find_by_name(baggage['player2'])
  new_baggage.save
  num_baggages += 1
end
puts "processed #{num_baggages} baggages"
