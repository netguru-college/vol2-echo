class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      notice[:success]
      redirect_to @league
    else
      render 'new'
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    if @league.update_attributes(league_params)
      redirect_to @league
    else
      render 'edit'
    end
  end

  def destroy
    League.find(params[:id]).destroy
    redirect_to leagues_path
  end

  def join
    @league = League.find(params[:id])
    if @league.users.include? current_user
      flash[:danger] = "You already belong to this league."
      redirect_to @league
    else
      flash[:success] = "Welcome to #{@league.name}"
      @league.users << current_user
      redirect_to @league
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :description)
  end
end
