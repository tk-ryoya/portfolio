require "rails_helper"

RSpec.describe CancelMailer, type: :mailer do
  describe '管理者へ予約キャンセルの通知メール' do
    let(:user) { create(:user) }
    let(:reservation) { create(:reservation, user: user) }
    let(:mail) { CancelMailer.cancel_notification(reservation, user) }
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
      expect(mail.subject).to eq '予約がキャンセルされました'
    end

    it 'メール本文にユーザーのフルネームが表示されていること' do
      expect(mail.html_part.body.to_s).to match(user.decorate.full_name)
    end

    it 'メール本文にキャンセルした予約日時が表示されていること' do
      expect(mail.html_part.body.to_s).to include(reservation.start_time.strftime("%m月%d日(#{wd[reservation.start_time.wday]}) %H:%M"))
    end
  end
end
