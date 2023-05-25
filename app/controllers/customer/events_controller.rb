class Customer::EventsController < ApplicationController
  # before_action :authenticate_customer!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :event_body, :start_time, :finish_time, :member)
  end
end
