class RepeateInterview < ApplicationRecord
  has_one :reservation_interviews, as: :interviewable

  enum condition: { nomal: 0, good: 1, bad: 2 }

  validates :condition, presence: true
  validates :description, length: { maximum: 255 }
end
