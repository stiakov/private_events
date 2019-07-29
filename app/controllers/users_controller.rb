class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in user
      flash[:success]="User created"
      redirect_to index_path
    else
      render 'new'
    end
  end

  def show
    @users = User.all 
  end

  private
  def user_params
    params.require(:user).permit(:name,:username,:email)
  end
end
