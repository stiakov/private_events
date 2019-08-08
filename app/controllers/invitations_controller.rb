# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new;end

  def create
    counter = 0
    guests = invitation_params[:guest_id].reject(&:blank?)
    guests.each do |i|
      found = Invitation.find_by(guest_id: i.to_i, invited_event_id: invitation_params[:invited_event_id].to_i)
      @invitation = Invitation.new(guest_id: i.to_i, invited_event_id: invitation_params[:invited_event_id].to_i) if found.nil?
      counter += 1 if @invitation.save
    end

    if guests.size > 0 && counter == guests.size
      flash[:success] = 'Invitations sent!'
      redirect_to user_path
    else
      flash[:danger] = 'You have to select a guest, please check'
      redirect_to myevents_path
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit({ guest_id: [] }, :invited_event_id)
  end
end
