class TimeUtils
  MONTHS = {1 => 'JAN', 2 => 'FEB', 3 => 'MAR', 4 => 'APR', 5 => 'MAY', 6 => 'JUN',
            7 => 'JUL', 8 => 'AUG', 9 => 'SEP', 10 => 'OCT', 11 => 'NOV', 12 => 'DEC'}

  def make_this_many_days_from_today_inclusive(how_many_days_later)
    for_each_array =* (1..how_many_days_later)
    time = []
    for_each_array.each do |days|
      time[days - 1] = Time.now + 60*60*24*days
    end
    time
  end

  def determine_if_is_before_today (string_date)
    date = Date.parse(string_date)
    return date < Date.today
  end

end