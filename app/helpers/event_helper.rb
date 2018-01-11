module EventHelper
  def upcoming
    if current_user
      events = current_user.events.select {|event| event.date >= Time.zone.today.beginning_of_day}
      events.sort_by &:date
    end

  end

  def previous
    if current_user
      events = current_user.events.select {|event| event.date < Time.zone.today.beginning_of_day}
      events.sort_by &:date
    end
  end

  def next_event
    if current_user && upcoming
      upcoming[0]
    end
  end

  def shared_with
    @event.users.select {|user| user.email != @event.owner.email}
  end

  def shared_with_me?
    shared_with.include?(current_user) ? true : false
  end



end
