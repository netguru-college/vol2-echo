class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_already_rated!

  def create
    league = League.find(params[:league_id])
    user_id = params[:user_id]
    rating = params[:rate]
    league.ratings.create(user_id: user_id, rate: rating)
    flash[:success] = "You have rated #{league.name} for #{rating}. Thank you."
    redirect_to league
  end

  private

  def check_if_already_rated!
    league = League.find(params[:league_id])
    redirect_to league unless league.ratings.where(user_id: current_user.id).empty?
  end
end
