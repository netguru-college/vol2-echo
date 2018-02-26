class MatchesController < ApplicationController
  def index
    @matches = Match.players
  end
end