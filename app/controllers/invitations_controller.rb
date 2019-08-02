class InvitationsController < ApplicationController
  def new
    if current_user.nil?
      flash[:danger]="You have to login to invite someone to an event!"
      redirect_to login_path
    # else
    #   @invitation = Invitation.new()
    end
  end

  def create
    # @invitation = Invitation.new(invitation_params)
    # if @invitation.save
    #   flash[:success]="Invitations sent!"
    #   redirect_to users_show_path
    # end
  end

  # private
  # def invitation_params
  #   params.require(invitation).permit()
  # end
end
