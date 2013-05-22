ENV['RAILS_ENV'] = "development"
require "../../config/environment.rb"

require 'csv'

puts "starting"
num_saved = 0
CSV.open("draft_list.csv", 'w') do |csv|
  csv << ["first_name", "last_name", "team"]
  Player.all.each do |player|
    if not player.first_name or not player.last_name or not player.team or not player.team.color
      puts "error processing #{player.name}"
      next
    end
    csv << [player.first_name, player.last_name, player.team.color]
    num_saved += 1
  end
end
puts "saved #{num_saved} players out of #{Player.all.length}"
