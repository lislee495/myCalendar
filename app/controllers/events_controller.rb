class User::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def index
  end

  def show
  end

  def destroy
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params

  end
end
