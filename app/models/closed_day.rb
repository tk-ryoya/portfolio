class ClosedDay < ApplicationRecord
  def self.schedules
    ClosedDay.pluck(:date)
  end

  def self.closed_am
    date = ClosedDay.all
    closed_am = date.map { |d| d.date if d.closed_days }
    closed_am.compact
  end

  def self.closed_pm
    date = ClosedDay.all
    closed_pm = date.map { |d| d.date if d.closed_days_pm }
    closed_pm.compact
  end
end
