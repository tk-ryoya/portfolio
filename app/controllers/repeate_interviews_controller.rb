class RepeateInterviewsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @repeate_interview = RepeateInterview.new
  end

  def create
    @repeate_interview = RepeateInterview.create(repeate_interview_params)
    @repeate_reservation = @repeate_interview.reservation_interviews.build(reservation_id: params[:reservation_id])
    reservation = Reservation.find(params[:reservation_id])
    reservation_start_time = reservation.start_time
    reservation_end_time = reservation_start_time + 1.hours
    calendar = Calendar.new
    if @repeate_reservation.save
      redirect_to reservations_path, success: t('.success')
      calendar.set_event("再診予約", "予約番号:  " + "「#{reservation.id}」", reservation_start_time, reservation_end_time)
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  private

  def repeate_interview_params
    params.require(:repeate_interview).permit(:condition, :description)
  end
end
