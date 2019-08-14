class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      current_user.attendances.build( { attended_event_id: @event.id } ).save
      flash[:success] = 'Event Created'
      redirect_to events_path
    else
      flash[:warning] = 'Check your inputs'
      render 'new'
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    invited = Invitation.all.where(invited_event_id: params[:id])
    ids = invited.map { |i| i[:guest_id] }
    ids << current_user.id unless current_user.nil?
    @users = User.all.where.not(id: [ids])
  end

  def index
    @all_events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :place, :date_event, :creator_id)
  end
end