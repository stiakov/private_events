class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.create()
  end

  def show
  end
end
