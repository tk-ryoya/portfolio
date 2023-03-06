class FirstInterviewsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @first_interview = FirstInterview.new
  end

  def create
    @first_interview = FirstInterview.create(first_interview_params)
    @first_reservation = @first_interview.reservation_interviews.build(reservation_id: params[:reservation_id])
    reservation = Reservation.find(params[:reservation_id])
    if @first_reservation.save
      redirect_to reservations_path, success: t('.success')
      FirstReservationMailer.reservation_notification(reservation, current_user, @first_interview.description).deliver_now
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  private

  def first_interview_params
    params.require(:first_interview).permit(:injury_date, :injury_position, :description)
  end
end
