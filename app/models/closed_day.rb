class ClosedDay < ApplicationRecord
  def self.schedules
    ClosedDay.pluck(:date)
  end
end
