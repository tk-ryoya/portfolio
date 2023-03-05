class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top user_policy privacy_policy]

  def top
    @reservations = Reservation.all.where("reservation_date >= ?", Date.current).where("reservation_date < ?", Date.current >> 3).order(reservation_date: :desc)

    @closed_days = ClosedDay.all
  end
end
