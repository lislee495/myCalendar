module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block, current_user).table
  end

  def week_calendar(date = Date.today, &block)
    Calendar.new(self, date, block, current_user).week_table
  end

  def day_calendar(date = Date.today, &block)
    Calendar.new(self, date, block, current_user).day_table
  end


end
