class CancelMailer < ApplicationMailer
  def cancel_notification(reservation, user)
    wd = %w[日 月 火 水 木 金 土]
    @reservation_time = reservation.start_time.strftime("%m月%d日(#{wd[reservation.start_time.wday]}) %H:%M")
    @user_name = user.decorate.full_name
    mail from: ENV['MAIL_ADDRESS'], to: ENV['HOSPITAL_DIRECTOR_MAIL_ADDRESS'], bcc: ENV['ADMIN_MAIL_ADDRESS'], subject: '予約がキャンセルされました'
  end
end
