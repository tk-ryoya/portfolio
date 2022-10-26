require "rails_helper"

RSpec.describe FirstReservationMailer, type: :mailer do
  describe '管理者へ予約完了の通知メール' do
    let(:user) { create(:user) }
    let(:reservation) { create(:reservation, user: user) }
    let(:first_interview) { create(:first_interview) }
    let(:mail) { FirstReservationMailer.reservation_notification(reservation, user, first_interview.description) }
    wd = ["日", "月", "火", "水", "木", "金", "土"]

    it '送信用のメールアドレスから送信されていること' do
      expect(mail.from).to eq [ENV['MAIL_ADDRESS']]
    end

    it '管理者のメールアドレスに送信されていること' do
      expect(mail.to).to eq [ENV['HOSPITAL_DIRECTOR_MAIL_ADDRESS']]
    end

    it '管理者のメールアドレスに送信されていること' do
      expect(mail.bcc).to eq [ENV['ADMIN_MAIL_ADDRESS']]
    end

    it '正しい件名で送信されていること' do
      expect(mail.subject).to eq '予約が入りました'
    end

    it 'メール本文にユーザーのフルネームが表示されていること' do
      expect(mail.html_part.body.to_s).to match(user.decorate.full_name)
    end

    it 'メール本文に予約日時が表示されていること' do
      expect(mail.html_part.body.to_s).to include(reservation.start_time.strftime("%m月%d日(#{wd[reservation.start_time.wday]}) %H:%M"))
    end

    it 'メール本文に予約詳細が表示されていること' do
      expect(mail.html_part.body.to_s).to match(first_interview.description)
    end
  end
end
