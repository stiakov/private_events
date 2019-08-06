# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    current_user
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_out
    reset_session
  end

  def redirect_to_login
    @_controller.redirect_to login_path
  end
end
