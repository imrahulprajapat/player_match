# frozen_string_literal: true

class MatchDetail < ApplicationRecord
  belongs_to :player
  belongs_to :match
  before_save :check_match_and_player

  validates :score, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0 }
  validates :player_id, uniqueness: { scope: :match_id, message: 'should happen once per match' }

  def check_match_and_player
    if match.match_details.count != 2 || player.match_details.count != 2
      errors.add(:base,
                 'only 2 players allowed per match for now')
    end
  end

  def player_profiles
    profile.total_matches = total_matches&.count

    if score > profile.highest_score
      profile.highest_score = score
      profile.highest_scorer_match = match.id
    end

    profile.lowest_score = score if profile.lowest_score == 0.0
    profile.lowest_score = score if profile.lowest_score != 0.0 && score < profile.lowest_score

    profile.avg_score = player&.matches&.average(:score)
    profile.save!
  end

  def add_player_score(new_score)
    return if match.is_completed

    self.score += new_score&.to_f
    save!
  end

  private

  def profile
    @profile ||= player.profile
  end

  def total_matches
    player.matches.completed
  end
end
