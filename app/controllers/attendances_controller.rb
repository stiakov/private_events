class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new()
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      flash[:success] = "You are scheduled for this event"
    else
      flash[:danger] = "Beeep!"
      redirect_to events_show_path
    end
  end

  private
  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end
