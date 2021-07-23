# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :player

  # def update_profile match, player_type
  #   self.total_matches += 1
  #   score, opp_player_id = player_type == 'playerone' ? match.playerone_score, match.playertwo_id : match.playertwo_score, match.playerone_id
  #   self.highest_score = score  if score > highest_score
  #   self.lowest_score = score if lowest_score == 0.0
  #   self.lowest_score = score if lowest_score != 0.0 && score < lowest_score

  # end
end
