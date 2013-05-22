# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130522055611) do

  create_table "baggages", :force => true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.string   "pick_to_lose"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "baggages", ["player1_id"], :name => "index_baggages_on_player1_id"
  add_index "baggages", ["player2_id"], :name => "index_baggages_on_player2_id"

  create_table "picks", :force => true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.string   "gender"
    t.boolean  "automatic"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "picks", ["player_id"], :name => "index_picks_on_player_id"
  add_index "picks", ["team_id"], :name => "index_picks_on_team_id"

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.integer  "team_id"
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["team_id"], :name => "index_players_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
