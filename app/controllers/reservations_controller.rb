class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @reservation = @reservations.find_by(user_id: current_user)
  end

  def new
    @reservation = current_user.reservations.build
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save && @reservation.reservation_type === 'first_interview'
      redirect_to new_reservation_first_interview_path(@reservation), success: '初診予約フォーム'
    elsif @reservation.save && @reservation.reservation_type === 'repeate_interview'
      redirect_to new_reservation_repeate_interview_path(@reservation), success: '再診予約フォーム'
    else
      flash.now[:error] = '予約に失敗しました'
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def update
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path, success: '予約変更しました'
    else
      flash.now[:error] = '予約変更に失敗しました'
    end
  end

  def delete
    @reservation = current_user.reservations.find(params[:id])
    @reservation.delete!
    redirect_to reservations_path, success: '予約キャンセルしました'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :reservation_type, :reservation_datetime)
  end
end
