
class Calendar < Struct.new(:view, :date, :callback, :user, :type)
  HEADER = %w[Sun Mon Tue Wed Thur Fri Sat]
  DAY_HEADER = %w[Time Events]
  START_DAY = :sunday

  delegate :content_tag, to: :view
  def table
    if type == "day"
      content_tag :table, class: "calendar table day-table" do
        header + hour_rows
      end
    else
      content_tag :table, class: "calendar table table-bordered week" do
        header + rows
      end
    end
  end

  def header
    if type == "day"
        content_tag :tr do
          DAY_HEADER.map { |header| content_tag :th, header, class: "cal-header" }.join.html_safe
        end
    else
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day, class: "cal-header" }.join.html_safe
      end
    end
  end

  def rows
    dates.map do |week|
      content_tag :tr do
        week.map { |day| day_cell(day) }.join.html_safe
      end
    end.join.html_safe
  end

  def day_cell(day)
    content_tag :td, view.capture(day, &callback), class: day_classes(day)
  end

  def day_classes(day)
    classes = []
    if type == "week"
      classes << "week-td"
    end
    classes << make_day_class(day)
    classes << "today" if day == Date.today
    classes.empty? ? nil : classes.join(" ")
  end

  def dates
    if type == "month"
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
    elsif type == "week"
      first = date.beginning_of_week(START_DAY)
      last = date.end_of_week(START_DAY)
    end
    (first..last).to_a.in_groups_of(7)
  end

  def make_day_class(d)
    @events_by_date = user.events.group_by(&:date)
    if @events_by_date[d]
        return "table-warning"
    end
  end
######DAY########
  def hour_rows
    hours.map do |hour|
      content_tag :tr, class: make_class(hour[1]) do
        hour.map {|hr| hour_cell(hr)}.join.html_safe
      end
    end.join.html_safe
  end

  def hour_cell(hour)
    content_tag :td, view.capture(hour, &callback), class: 'day-cal'
  end

  def hours
    from_tm = Time.new(date.year, date.month, date.day, 0, 0, 0)
    to_tm = from_tm + 24.hour
    hr_array = ( from_tm.to_i..to_tm.to_i ).step( 1.hour ).to_a
    make_hours(hr_array)
  end

  def make_hours(array)
    new_array = []
    i = 0
    while i < 24
      new_array.push(array[i])
      new_array.push(i)
      i+=1
    end
    new_array.in_groups_of(2)
  end

  def make_class(hr)
    @events_by_date = user.events.group_by(&:date)
    if @events_by_date[date]
       @events_by_date[date].each do |event|
      if hr >= event.start_time.strftime("%k").to_i && hr <= event.end_time.strftime("%k").to_i
        return "table-warning day-cal"
      end
    end
  end
 end

end
