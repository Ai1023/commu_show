class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @event = Event.find(params[:id])
    @join_event_list = @event.join_events
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
      flash[:notice] = "イベントを作成しました"
      redirect_to admin_events_path
    else
      @events = Event.all
      render 'index'
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to admin_event_path(event.id)
    else
      render 'edit'
    end
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
