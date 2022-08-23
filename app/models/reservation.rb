class Reservation < ApplicationRecord
  belongs_to :user

  enum reservation_type: { first: 0, repeate: 1}

  validates :reservation_type, presence: true
  validates :reservation_datetime, presence: true
end
