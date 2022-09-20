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
end
