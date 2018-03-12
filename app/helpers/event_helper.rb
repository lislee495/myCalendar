module EventHelper
  def upcoming
    if current_user
      events = current_user.events.select {|event| event.date.to_time + event.start_time.seconds_since_midnight.seconds >= Time.zone.now}
      events.sort_by &:date
    end
  end

  def previous
    if current_user
      events = current_user.events.select {|event| event.date.to_time + event.start_time.seconds_since_midnight.seconds < Time.zone.now}
      events.sort_by &:date
    end
  end

  def next_event
    upcoming[0] if current_user && upcoming
  end

  def shared_with
    @event.users.select {|user| user.email != @event.owner.email}
  end

  def shared_with_me?
    shared_with.include?(current_user) ? true : false
  end
end
