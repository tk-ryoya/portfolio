namespace :temporary_closing_days do
  desc '臨時休診日をGoogleCalendarから取得する'
  task get_dates: :environment do
    cal = Calendar.new
    closed_days = cal.closed_days
    closed_days_pm = cal.closed_days_pm

    closed_days.each do |closed_day|
      schedules = ClosedDay.schedules
      ClosedDay.create(date: closed_day, closed_days: true) unless schedules.include?(closed_day)
    end

    closed_days_pm.each do |closed_day_pm|
      schedules = ClosedDay.schedules
      ClosedDay.create(date: closed_day_pm, closed_days_pm: true) unless schedules.include?(closed_day_pm)
    end
  end
end
