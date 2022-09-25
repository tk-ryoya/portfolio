class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all.order(reservation_date: :desc)
  end

  def new
    @reservation = current_user.reservations.build
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    message = Reservation.check_reservation_day(@day.to_date, @time.to_time)
    redirect_to root_path, error: message if !!message
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save && @reservation.first_interview?
      redirect_to new_reservation_first_interview_path(@reservation), success: t('first_interviews.new.title')
    elsif @reservation.save && @reservation.repeate_interview?
      redirect_to new_reservation_repeate_interview_path(@reservation), success: t('repeate_interviews.new.title')
    else
      flash.now[:error] = t('.fail')
    end
  end

  def delete
    @reservation = current_user.reservations.find(params[:id])
    calendar = Calendar.new
    event_id = calendar.match_reservations(@reservation)
    @reservation.delete!
    calendar.delete(event_id)
    redirect_to reservations_path, success: t('.success')
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :reservation_type, :reservation_date, :reservation_time, :start_time)
  end
end
