module TimelineHelper
  def time_ago(time, timezone)
    now = Time.now.in_time_zone(timezone)
    time = time.in_time_zone(timezone)

    now_date = now.to_date
    time_date = time.to_date
    day_diff = (now_date - time_date).numerator

    sec_diff = (now - time).to_i

    if day_diff == 0
      if sec_diff < 60
        I18n.translate :seconds_ago, count: sec_diff
      elsif sec_diff < 3600
        I18n.translate :minutes_ago, count: sec_diff / 60
      else
        I18n.translate :hours_ago, count: sec_diff / 60 / 60
      end
    elsif time_date.cweek == now_date.cweek and day_diff < 4
      if day_diff == 1
        I18n.localize time, format: :yesterday
      else
        I18n.localize time, format: :weekday
      end
    elsif now_date.year == time_date.year
      I18n.localize time, format: :day_month
    else
      I18n.localize time, format: :date
    end
  end
end