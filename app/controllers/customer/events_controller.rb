class Customer::EventsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @events = Event.all
    join_events = JoinEvent.where(customer_id: current_customer.id).pluck(:event_id)
    @join_event_list = Event.find(join_events)
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :event_body, :start_time, :finish_time)
  end
end
