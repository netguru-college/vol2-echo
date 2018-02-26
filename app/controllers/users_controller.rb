class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User edited."
      redirect_to @user
    else
      flash[:danger] = "Could not edit user."
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end
end
