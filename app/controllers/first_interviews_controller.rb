class FirstInterviewsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @first_interview = FirstInterview.new
  end

  def create
    @first_interview = FirstInterview.create(first_interview_params)
    @first_reservation = @first_interview.reservation_interviews.build(reservation_id: params[:reservation_id])
    if @first_reservation.save
      redirect_to reservations_path, success: '予約しました'
    else
      flash.now[:error] = '予約に失敗しました'
      render :new
    end
  end

  private

  def first_interview_params
    params.require(:first_interview).permit(:injury_date, :injury_position, :description)
  end
end
