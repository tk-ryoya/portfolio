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
    if @reservation.save
      redirect_to reservations_path, '予約しました'
    else
      flash.now[:error] = '予約に失敗しました'
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def edit
    @reservation = current_user.reservations.find(params[:id])
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
