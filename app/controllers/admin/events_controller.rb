class Admin::EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path
    else
      render 'index'
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to admin_event_path(event.id)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to admin_events_path
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :event_body, :start_time, :finish_time)
  end
end
