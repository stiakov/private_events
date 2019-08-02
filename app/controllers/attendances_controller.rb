class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      event = Event.find_by_id(params[:attended_event_id])
      flash[:success] = "You are scheduled for #{event.title.upcase}"
      redirect_to events_index_path
    else
      flash[:danger] = 'Beeep!'
      redirect_to events_show_path
    end
  end

  private

  def attendance_params
    params.permit(:attendee_id, :attended_event_id)
  end
end