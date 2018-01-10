module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  def week_calendar(date = Date.today, &block)
    Calendar.new(self, date, block).week_table
  end


end
