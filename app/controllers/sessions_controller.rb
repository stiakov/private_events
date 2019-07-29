class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    @session = User.find_by(params[:email])
    if !@session.nil?
      log_in @session
      redirect_to index_path
    else 
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def home;end
end