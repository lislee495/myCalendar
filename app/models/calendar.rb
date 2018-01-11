
class Calendar < Struct.new(:view, :date, :callback, :user)
  HEADER = %w[Sun Mon Tue Wed Thur Fri Sat]
  START_DAY = :sunday

  delegate :content_tag, to: :view
  ###############################MONTH######################################
  def table
    content_tag :table, class: "calendar table table-bordered table-striped" do
      header + week_rows
    end
  end

  def header
    content_tag :tr do
      HEADER.map { |day| content_tag :th, day }.join.html_safe
    end
  end

  def week_rows
    weeks.map do |week|
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
    classes << make_day_class(day)
    classes << "today" if day == Date.today
    classes << "not-month" if day.month != date.month
    classes.empty? ? nil : classes.join(" ")
  end

  def weeks
    first = date.beginning_of_month.beginning_of_week(START_DAY)
    last = date.end_of_month.end_of_week(START_DAY)
    (first..last).to_a.in_groups_of(7)
  end
  ########################WEEK############################

  def week_table
    content_tag :table, class: "calendar table table-bordered table-striped" do
      header + day_rows
    end
  end

  def day_rows
    content_tag :tr do
      week.map { |day| week_day_cell(day) }.join.html_safe
    end
  end

  def week_day_cell(day)
    content_tag :td, view.capture(day, &callback), class: week_day_classes(day)
  end

  def week_day_classes(day)
    classes = []
    classes << make_day_class(day)
    classes << "today" if day == Date.today
    classes << "not-week" if week_day(day) != week_day(date)
    classes.empty? ? nil : classes.join(" ")
  end

  def week
    first = date.beginning_of_week(START_DAY)
    last = date.end_of_week(START_DAY)
    (first..last).to_a
  end

  def week_day(day)
    first = date.beginning_of_week(START_DAY)
    last = date.end_of_week(START_DAY)
    (first..last).to_a.in_groups_of(7)
  end

  def make_day_class(d)
    @events_by_date = user.events.group_by(&:date)
    if @events_by_date[d]
        return "table-warning"
    end
  end


  #####################DAY###############################
  DAY_HEADER = %w[Time Events]


  def day_table
    content_tag :table, class: "calendar table" do
      day_header + hour_rows
    end
  end

  def day_header
    content_tag :tr do
      DAY_HEADER.map { |header| content_tag :th, header }.join.html_safe
    end
  end

  def hour_rows
    hours.map do |hour|
      content_tag :tr, class: make_class(hour[1]) do
        hour.map {|hr| hour_cell(hr)}.join.html_safe
      end
    end.join.html_safe
  end

  def hour_cell(hour)
    content_tag :td, view.capture(hour, &callback)
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
      if hr >= event.start_time.strftime("%l").to_i && hr <= event.start_time.strftime("%l").to_i
        return "table-warning"
      end
    end
  end
 end

end
