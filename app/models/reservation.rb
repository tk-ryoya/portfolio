class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_interviews

  enum reservation_type: { repeate_interview: 0, first_interview: 1 }

  validates :reservation_type, presence: true
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  validates :start_time, presence: true

  now = Time.current

  scope :reservations_09_10, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,9,0,0)..Time.new(now.year,now.month,now.day,10,0,0)) }
  scope :reservations_10_11, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,10,0,0)..Time.new(now.year,now.month,now.day,11,0,0)) }
  scope :reservations_11_12, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,11,0,0)..Time.new(now.year,now.month,now.day,12,0,0)) }
  scope :reservations_16_17, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,16,0,0)..Time.new(now.year,now.month,now.day,17,0,0)) }
  scope :reservations_17_18, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,17,0,0)..Time.new(now.year,now.month,now.day,18,0,0)) }
  scope :reservations_18_19, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,18,0,0)..Time.new(now.year,now.month,now.day,19,0,0)) }

  def delete!
    self.deleted_at = Time.now
    save!
  end
end
