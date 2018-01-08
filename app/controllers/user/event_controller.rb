class User::EventController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  helper EventHelper
  def month
    @events = current_user.events.all
  end

  def week
    @events = current_user.events.all
  end

  def today
    @events = current_user.events.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user
    if @event.save
      current_user.events << @event
      # if event_params[:user_ids] != ""
      #   user = User.find_by(id: event_params[:user_ids])
      #   user.events << @event
      # end
      redirect_to user_event_path(@event)
    else
      render :new
    end
  end

  def update
    if @event.owner == current_user
      if @event.update(event_params)
        redirect_to user_event_path(@event)
      else
        render :edit
      end
    else
      flash[:notice] = "You don't have permission to do this!"
      redirect_to user_events_path
    end
  end

  def edit
  end

  def index
    @events = current_user.events
  end

  def show
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event deleted"
    redirect_to user_events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:short_description, :date, :time, :additional_info, :user_ids, :categories_attributes => [:name])
  end
end
