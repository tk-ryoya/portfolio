require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe 'お問い合わせフォーム' do
    let(:contact) { create(:contact) }
    let(:mail) { ContactMailer.contact_mail(contact) }

    it '入力されたメールアドレスから送信されていること' do
      expect(mail.from).to eq [contact.email]
    end

    it '管理者のメールアドレスに送信されていること' do
      expect(mail.to).to eq [ENV['ADMIN_MAIL_ADDRESS']]
    end

    it '入力された件名で送信されていること' do
      expect(mail.subject).to eq 'Webサイトより問い合わせが届きました'
    end

    it '入力された内容で送信されていること' do
      expect(mail.html_part.body.to_s).to match(contact.content)
    end
  end
end
