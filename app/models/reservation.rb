class Reservation < ApplicationRecord
  belongs_to :user

  enum reservation_type: { first_interview: 0, repeate_interview: 1 }

  validates :reservation_type, presence: true
  validates :reservation_datetime, presence: true
end