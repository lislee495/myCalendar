class User::CalendarController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dates_events
  helper CalendarHelper
  layout "calendar"

  def month
  end

  def week
  end

  def day
  end

  private

  def set_dates_events
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = current_user.events.group_by(&:date)
  end
end
