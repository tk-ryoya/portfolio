class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_interviews

  enum reservation_type: { repeate_interview: 0, first_interview: 1 }

  validates :reservation_type, presence: true
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  validates :start_time, presence: true

  def self.check_reservation_day(day)
    if day < Date.current
      return '過去の日付は選択できません'
    elsif day < (Date.current + 1)
      return '当日予約は電話にてご連絡ください'
    elsif BusinessCalendar.temporary_closed_day?(day)
      return '臨時休診のため選択できません'
    elsif BusinessCalendar.temporary_closed_day_pm?(day)
      return '午後休診(臨時)のため、電話にてお問い合わせください'
    end
  end

  def delete!
    self.deleted_at = Time.current
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
