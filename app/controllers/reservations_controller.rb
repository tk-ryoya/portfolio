class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order(reservation_datetime: :desc)
    @reservation = @reservations.find_by(user_id: current_user)
  end

  def new
    @reservation = current_user.reservations.build
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

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def update
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
    end
  end

  def delete
    @reservation = current_user.reservations.find(params[:id])
    @reservation.delete!
    redirect_to reservations_path, success: t('.success')
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :reservation_type, :reservation_datetime)
  end
end
