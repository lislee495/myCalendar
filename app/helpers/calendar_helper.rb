module CalendarHelper
  def calendar(date = Date.today, type, &block)
    Calendar.new(self, date, block, current_user, type).table
  end
end
