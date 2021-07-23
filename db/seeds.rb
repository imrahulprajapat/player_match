# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..30).each do |i|
  Player.create(full_name: "test player #{i}", country_code: '+91', contact_number: "343#{i}43#{i}")
end

(1..15).each do |i|
  Match.new(title: "match title #{i}").save!
end

(1..15).each do |i|
  MatchDetail.find_or_create_by(match_id: i, player_id: i) do |match_detail|
    match_detail.score = 20.00
  end
  MatchDetail.find_or_create_by(match_id: i, player_id: i + 15) do |match_detail|
    match_detail.score = 20.10
  end
end
