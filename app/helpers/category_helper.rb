module CategoryHelper
  def category_upcoming(category)
    @events = category.events.select {|event| event.date >= Time.zone.today.beginning_of_day}
    @events.sort_by &:date
  end

  def category_previous(category)
    @events = category.events.select {|event| event.date < Time.zone.today.beginning_of_day}
    @events.sort_by &:date
  end

  def category_next_event(category)
    if current_user && category_upcoming(category)
      category_upcoming(category)[0]
    end
  end


end
