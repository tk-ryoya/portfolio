class ReservationInterview < ApplicationRecord
  belongs_to :reservation
  belongs_to :interviewable, polymorphic: true
end
