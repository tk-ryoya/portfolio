class FirstInterview < ApplicationRecord
  has_one :reservation_interviews, as: :interviewable

  enum injury_position: {
    neck_shoulder: 0,
    waist_back: 1,
    arm_hand: 2,
    chest_abdomen: 3,
    leg: 4
  }

  validates :injury_date, presence: true
  validates :injury_position, presence: true
  validates :description, length: { maximum: 255 }
end
