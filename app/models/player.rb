# frozen_string_literal: true

class Player < ApplicationRecord
  has_one :profile
  has_many :match_details
  has_many :matches, through: :match_details

  validates :full_name, :country_code, presence: true
  validates :contact_number, presence: true, uniqueness: true
  before_validation :downcase_name

  scope :top_10_players, -> { joins(:profile).order('profiles.highest_score desc').limit(10) }

  after_commit on: :create do
    build_profile.save!
  end

  def downcase_name
    self.full_name = full_name.titlecase
  end

  def number
    "#{country_code}-#{contact_number}"
  end
end
