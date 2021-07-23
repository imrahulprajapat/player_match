# frozen_string_literal: true

class MatchController < ApplicationController
  before_action :find_match, only: %i[show finish_match add_score edit update]
  before_action :find_match_details, only: %i[show add_score]

  def index
    @matches = Match.all&.sort_by { |a| a.is_completed ? 1 : 0 }
    @match = Match.new
    @url = match_index_path(@match)
  end

  def create
    match = Match.create!(match_params)
    redirect_to match_index_path
  end

  def edit
    @url = match_path(@match)
  end

  def update
    @match.update!(match_params)
    redirect_to match_index_path
  end

  def show
    @match_details = @match_details.preload(:player)
  end

  def finish_match
    @match.finish_match! unless @match.is_completed
    redirect_to match_path(@match)
  end

  def add_score
    if Essential.is_number?(params[:score]) && !@match.is_completed && params[:score]&.to_f&.positive?
      match_detail = @match_details.find_by(player_id: params[:player_id])
      match_detail.add_player_score(params[:score])
    end
    redirect_to match_path(@match)
  end

  private

  def find_match
    @match = Match.find_by_id(params[:id] || params[:match_id])
  end

  def find_match_details
    @match_details = @match.match_details
  end

  def match_params
    params.require(:match).permit(:title)
  end
end
