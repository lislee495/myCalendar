module CategoryHelper
  def category_upcoming
    if current_user
      events = current_user.categories.events.select {|event| event.date >= Time.zone.today.beginning_of_day}
      events.sort_by &:date
    end

  end

  def category_previous
    if current_user
      events = current_user.categories.events.select {|event| event.date < Time.zone.today.beginning_of_day}
      events.sort_by &:date
    end
  end

  def category_next_event
    if current_user
      upcoming[0]
    end
  end


end
