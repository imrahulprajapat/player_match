# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @players = Player.top_10_players.preload(:profile)
  end
end
