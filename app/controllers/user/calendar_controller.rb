class User::CalendarController < ApplicationController
  before_action :authenticate_user!
  helper CalendarHelper
  layout "calendar"

  def month
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = current_user.events.group_by(&:date)
  end

  def week
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = current_user.events.group_by(&:date)
  end

  def day
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = current_user.events.group_by(&:date)
  end
end
