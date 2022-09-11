class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_interviews

  enum reservation_type: { repeate_interview: 0, first_interview: 1 }

  validates :reservation_type, presence: true
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  validates :start_time, presence: true

  now = Time.current

  scope :reservations_09_10, -> { where(start_time: Time.new(now.year,now.month,now.day,9,0,0)..Time.new(now.year,now.month,now.day,10,0,0)) }
  # scope :reservations_10_11, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,10,0,0)..Time.new(now.year,now.month,now.day,11,0,0)) }
  # scope :reservations_11_12, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,11,0,0)..Time.new(now.year,now.month,now.day,12,0,0)) }
  # scope :reservations_16_17, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,16,0,0)..Time.new(now.year,now.month,now.day,17,0,0)) }
  # scope :reservations_17_18, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,17,0,0)..Time.new(now.year,now.month,now.day,18,0,0)) }
  # scope :reservations_18_19, -> { where(reservation_datetime: Time.new(now.year,now.month,now.day,18,0,0)..Time.new(now.year,now.month,now.day,19,0,0)) }

  def delete!
    self.deleted_at = Time.now
    save!
  end

  def self.reservations_after_three_month
    reservations = Reservation.all.where("reservation_date >= ?", Date.current).where("reservation_date < ?", Date.current >> 3).order(reservation_date: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservation_hash = {}
      reservation_hash.merge!(day: reservation.reservation_date.strftime("%Y-%m-%d"), time: reservation.reservation_time)
      reservation_data.push(reservation_hash)
    end
    reservation_data
  end
end
