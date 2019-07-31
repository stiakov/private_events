class EventsController < ApplicationController
  def new
    @event = Event.new()
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event Created'
      redirect_to events_show_path
    else
      flash[:warning] = 'Check your inputs'
      render 'new'
    end
  end

  def show
    @event = current_user.events.last
  end

  def index
    @all_events = Event.all
  end

  def my_events
    @my_events = current_user.events.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :place, :date_event, :creator_id)
  end
end
