class Customer::JoinEventsController < ApplicationController
  before_action :authenticate_customer!

  def create
    event = Event.find(params[:event_id])
    join_event = current_customer.join_events.new(event_id: event.id)
    join_event.save
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])
    join_event = current_customer.join_events.find_by(event_id: event.id)
    join_event.destroy
    redirect_to event_path(event)
  end
end
