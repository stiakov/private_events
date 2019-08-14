class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      event = Event.find_by_id(params[:attended_event_id])
      invitation_accepted?(event, true)
      flash[:success] = "You are scheduled for #{event.title.upcase}"
      redirect_to events_path
    else
      flash[:danger] = 'Beeep!'
      redirect_to events_show_path
    end
  end

  def destroy
    # @attendance = current_user.attendances.find_by(attended_event_id: params[:attended_event_id])
    event = Event.find_by_id(params[:attended_event_id])
    invitation_accepted?(event, false)
    # invitation_accepted?(@attendance.attended_event_id, false)
    flash[:success]="Attendance cancelled" if event.delete 
    redirect_to events_path
  end

  private

  def invitation_accepted?(event, val)
    temp= current_user.invitations.find_by(invited_event_id: event)
    temp.acceptance = val
    temp.save
  end

  def attendance_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
