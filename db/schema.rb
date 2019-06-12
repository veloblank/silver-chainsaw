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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190612010404) do

  create_table "contestant_picks", force: :cascade do |t|
    t.integer  "contestant_id"
    t.integer  "prop_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contestants", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "current_streak"
    t.integer  "best_streak"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "pick_histories", force: :cascade do |t|
    t.integer  "contestant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "props", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_time"
    t.string   "sport"
    t.string   "home_team"
    t.string   "away_team"
    t.string   "espn_game_identifier"
    t.boolean  "home_team_won?"
    t.boolean  "away_team_won?"
    t.boolean  "scored_by_admin?",     default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "board_id"
  end

end
