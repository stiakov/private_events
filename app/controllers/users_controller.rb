class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'User created'
      redirect_to index_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @user_upcoming_attendances = @user.attended_events.present_and_future
    @user_past_attendances = @user.attended_events.past_gone
    @user_pending_inv = @user.invitations.all.where(acceptance: nil)
    @user_pending_inv = @user_pending_inv.reject {|i| i.invited_event.date_event <= Time.current }
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
end
