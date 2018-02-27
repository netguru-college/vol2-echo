class MatchesController < ApplicationController
  def index
    @matches = Match.includes(:player1, :player2)
  end
end