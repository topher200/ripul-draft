ENV['RAILS_ENV'] = "development"
require "../../config/environment.rb"

require 'csv'

puts "starting"
num_saved = 0
CSV.open("draft_list.csv", 'w') do |csv|
  csv << ["team", "gender", "pick_number", "first_name", "last_name", "ripul_db_id_number"]
  Player.all.each do |player|
    if not player.first_name or not player.last_name or not player.team or not player.team.color
      puts "error processing #{player.name}"
      next
    end
    pick_number = 0
    if player.pick
      pick_number = player.pick.number
    end
    csv << [player.team.color, player.gender, '%03d' % pick_number, player.first_name, player.last_name, player.ripul_id_number]
    num_saved += 1
  end
end
puts "saved #{num_saved} players out of #{Player.all.length}"
