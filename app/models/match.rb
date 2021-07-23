# frozen_string_literal: true

class Match < ApplicationRecord
  has_many :match_details
  has_many :players, through: :match_details

  before_save :check_and_validate
  validates :title, presence: true
  after_commit :update_player_profiles, if: proc { |match| match.is_completed }

  scope :completed, -> { where(is_completed: true) }
  scope :pending, -> { where(is_completed: false) }

  def finish_match!
    errors.add(:base, '2 players need to finish this match') unless match_details.count == 2
    update!(is_completed: true, winner_id: get_winner_id) unless is_completed
  end

  def check_and_validate
    errors.add(:base, 'cant update match when completed') if is_completed
    self.title = title.titlecase
  end

  def update_player_profiles
    match_details.each(&:player_profiles)
  end

  def winner
    Player.find_by_id(winner_id)
  end

  private

  def get_winner_id
    match_details.order('score desc').load.first.player_id
  end
end
