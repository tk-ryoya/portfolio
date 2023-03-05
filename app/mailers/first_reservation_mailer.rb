class FirstReservationMailer < ApplicationMailer
  def reservation_notification(reservation, user, first_interview_description)
    wd = %w[日 月 火 水 木 金 土]
    @reservation_time = reservation.start_time.strftime("%m月%d日(#{wd[reservation.start_time.wday]}) %H:%M")
    @user_name = user.decorate.full_name
    @description = first_interview_description
    mail from: ENV['MAIL_ADDRESS'], to: ENV['HOSPITAL_DIRECTOR_MAIL_ADDRESS'], bcc: ENV['ADMIN_MAIL_ADDRESS'], subject: '予約が入りました'
  end
end
