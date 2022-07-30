class EventAttendeesController < ApplicationController
  def new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_back fallback_location: root_path, notice: "You have succesfully registered for the event."
  end

  def destroy
    @attendance = User.find_by(id: current_user.id).event_attendees.find_by(event_id: params[:id])
    @attendance.destroy

    redirect_back fallback_location: root_path, status: :see_other, notice: "Event attendance deleted succesfully"
  end
end
