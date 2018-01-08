module EventHelper
  def upcoming
    events = current_user.events.select {|event| event.date >= Time.zone.today.beginning_of_day}
    events.sort_by &:date

  end

  def previous
    events = current_user.events.select {|event| event.date < Time.zone.today.beginning_of_day}
    events.sort_by &:date
  end

  def next_event
    upcoming[0]
  end

  def start_date
    :date
  end

  def start_time
    :time
  end 

end
