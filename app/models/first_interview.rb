class FirstInterview < ApplicationRecord
  has_many :reservation_interviews, as: :interviewable

  validates :injury_date, presence: true
  validates :injury_position, presence: true
  validates :description, length: { maximum: 255 }
end
