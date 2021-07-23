# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_720_182_930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'match_details', force: :cascade do |t|
    t.bigint 'player_id'
    t.bigint 'match_id'
    t.decimal 'score', precision: 32, scale: 16, default: '0.0', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['match_id'], name: 'index_match_details_on_match_id'
    t.index ['player_id'], name: 'index_match_details_on_player_id'
  end

  create_table 'matches', force: :cascade do |t|
    t.string 'title'
    t.boolean 'is_completed', default: false
    t.bigint 'winner_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['is_completed'], name: 'index_matches_on_is_completed'
    t.index ['winner_id'], name: 'index_matches_on_winner_id'
  end

  create_table 'players', force: :cascade do |t|
    t.string 'full_name'
    t.string 'country_code', limit: 3
    t.integer 'contact_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['contact_number'], name: 'index_players_on_contact_number'
  end

  create_table 'profiles', force: :cascade do |t|
    t.bigint 'player_id'
    t.integer 'total_matches', default: 0
    t.decimal 'highest_score', precision: 32, scale: 16, default: '0.0', null: false
    t.decimal 'lowest_score', precision: 32, scale: 16, default: '0.0', null: false
    t.decimal 'avg_score', precision: 32, scale: 16, default: '0.0', null: false
    t.integer 'highest_scorer_match'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['avg_score'], name: 'index_profiles_on_avg_score'
    t.index ['highest_score'], name: 'index_profiles_on_highest_score'
    t.index ['highest_scorer_match'], name: 'index_profiles_on_highest_scorer_match'
    t.index ['lowest_score'], name: 'index_profiles_on_lowest_score'
    t.index ['player_id'], name: 'index_profiles_on_player_id'
    t.index ['total_matches'], name: 'index_profiles_on_total_matches'
  end
end
