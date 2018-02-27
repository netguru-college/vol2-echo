class MatchesController < ApplicationController
  def index
    @matches = Match.includes(:player1, :player2)
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    # binding.pry
    if @match.update_attributes(match_params)
      flash[:success] = 'Score updated.'
    else
      flash[:danger] = 'Could not update score.'
    end

    redirect_to league_path(@match.league.id)
  end

  private

  def match_params
    params.require(:match).permit(:player1_goals, :player2_goals)
  end
end
