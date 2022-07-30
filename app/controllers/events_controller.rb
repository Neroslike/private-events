class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :owner_only, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path, notice: "Event created succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: "Event updated succesfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other, notice: "Event deleted succesfully"
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :user_id)
  end

  def owner_only
    if current_user != Event.find(params[:id]).creator
      redirect_to root_url, alert: 'You are not allowed to do that'
    end
  end
end
