class Admin::ReservationsController < Admin::BaseController
  before_action :set_reservation, only: %i[edit update show destroy]

  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true).order(start_time: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      redirect_to admin_reservation_path(@reservation), success: t('.success')
    else
      flash.now[:error] = t('')
      render :edit
    end
  end

  def show
    user_id = @reservation.user_id
    @user = User.find(user_id)
  end

  def destroy
    @reservation.destroy!
    redirect_to admin_reservations_path, success: t('.success')
  end


  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :reservation_type, :reservation_date, :reservation_time, :start_time)
  end
end
