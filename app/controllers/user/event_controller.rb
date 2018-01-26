class User::EventController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  helper EventHelper

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user
    if @event.save
      current_user.events << @event
      redirect_to user_event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = current_user.events
  end

  def show
  end

  def edit
  end

  def update
    if @event.owner == current_user
    @event.update(event_params)
    if @event.save
        redirect_to user_event_path(@event)
      else
        render :edit
      end
    else
      flash[:notice] = "You don't have permission to do this!"
      redirect_to user_events_path
    end
  end


  def destroy
    @event.delete
    flash[:notice] = "Event deleted"
    redirect_to user_event_index_path
  end

  def unshare
    @user_event = EventUser.find_by(user_id: params[:event][:user_ids])
    @event = Event.find(@user_event.event_id)
    @user_event.delete
    redirect_to user_event_index_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:short_description, :date, :end_time, :start_time, :additional_info, :user_ids, :categories_attributes => [:name, :owner_id])
  end
end
