class BusinessCalendar
  include ActiveModel::Model

  def self.temporary_closed_day?(day)
    calendar = Calendar.new
    closed_days = calendar.closed_days
    closed_day = closed_days.map { |closed_day| closed_day == day }
    closed_day.any?
  end

  def self.temporary_closed_day_pm?(day)
    calendar = Calendar.new
    closed_days_pm = calendar.closed_days_pm
    closed_day_pm = closed_days_pm.map { |closed_day_pm| closed_day_pm == day }
    closed_day_pm.any?
  end

  def self.temporary_closed_day
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    calendar = Calendar.new
    closed_days = calendar.closed_days
    closed_day = closed_days.map { |closed_day| closed_day.strftime("%m月 %d日 (#{wd[closed_day.wday]})") }
  end

  def self.temporary_closed_day_pm
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    calendar = Calendar.new
    closed_days_pm = calendar.closed_days_pm
    closed_day_pm = closed_days_pm.map { |closed_day_pm| closed_day_pm.strftime("%m月 %d日 (#{wd[closed_day_pm.wday]})") }
  end
end
