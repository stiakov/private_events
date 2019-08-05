# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new
    @users = User.all.where.not(id: current_user.id)
    @temp = Hash.new
    @events = current_user.events.each {|i| @temp[i.title] = i.id }
    @invitation = Invitation.new
    if current_user.nil?
      flash[:danger] = 'You have to login to invite someone to an event!'
      redirect_to login_path
      # else
      #   @invitation = Invitation.new()
    end
  end
#user = User.all.where.not(id: [1,3])
#Invitation.all.where(guest_id:3, invited_event_id: 2)
  def create
    counter = 0
    guests = invitation_params[:guest_id].reject(&:blank?)
    
    guests.each do |i|
      # invited = Invitation.all.where(invited_event_id: 8)
      # ids = invited.map {|i| i[:guest_id]}
      # @users = User.all.where.not(ids)  
###
      valid = Invitation.find_by(guest_id: i.to_i, invited_event_id: invitation_params[:invited_event_id].to_i)
      @invitation = Invitation.new(guest_id: i.to_i, invited_event_id: invitation_params[:invited_event_id].to_i) unless valid
      counter += 1 if @invitation.save
    end

    if counter == guests.size
      flash[:success] = 'Invitations sent!'
      redirect_to users_show_path
    else
      render json: { status: '404 Something went wrong' }
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit({ guest_id: [] }, :invited_event_id)
  end
end
