# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	ruby-2.5.0
* System dependencies

* Configuration

* Database creation

* Database initialization

### Create two players
		Player.create(full_name: "test player 1", country_code: '+91', contact_number: "3431431")
		Player.create(full_name: "test player 2", country_code: '+91', contact_number: "3432432")
### Create match
		match = Match.new(title: "match title here").save!

### Create Match details
 	MatchDetail.new(match_id: match.id, player_id: Player.first.id, score: 20.0).save!
 	MatchDetail.new(match_id: match.id, player_id: Player.last.id, score: 21.0).save!

### Finish match
		match.finish_match!