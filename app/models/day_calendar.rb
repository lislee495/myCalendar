class DayCalendar < Struct.new(:view, :date, :callback)
  DAY_HEADER = %w["", Date]


  def day_table
    content_tag :table, class: "calendar table table-bordered table-striped" do
      header + hour_rows
    end
  end

  def day_header
    content_tag :tr do
      HEADER.map { |header| content_tag :th, header }.join.html_safe
    end
  end

  def hour_rows
    hours.map do |hour|
      content_tag :tr do
        hour.map {|hr| hour_cell(hr)}.join.html_safe
      end
    end.join.html_safe
  end

  def hour_cell(hour)
    content_tag :td, view.capture(hour, &callback)
  end

  def hours(date)
    from_tm = Time.new(date.year, date.month, date.day, 0, 0, 0)
    to_tm = from_tm + 24.hour
    hr_array = ( from_tm.to_i..to_tm.to_i ).step( 1.hour )
    make_hours(hr_array)
  end

  def make_hours(array)
    new_array = []
    i = 0
    while i < 24 do
      new_array.push(array[i])
      new_array.push(" ")
      i ++
    end
    new_array.in_groups_of(2)
  end
end
