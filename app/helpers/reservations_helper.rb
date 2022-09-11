module ReservationsHelper
  def times
    times = ["9:00",
             "10:00",
             "11:00",
             "16:00",
             "17:00",
             "18:00"]
  end

  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:reservation_date].eql?(day.strftime("%Y-%m-%d")) && reservation[:reservation_time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:reservation_date].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:reservation_time].eql?(time)
      return result if result
    end
    return result
  end
end
