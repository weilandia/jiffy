class UsersController < ApplicationController
  before_action :find_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:notice] = "Sorry Jifster, something went wrong :(... Please try again."
      render :new
    end
  end

  def show
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = current_user
  end
end
