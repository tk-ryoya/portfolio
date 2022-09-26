class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail from: contact.email, to: ENV['MAIL_ADDRESS'], subject: 'Webサイトより問い合わせが届きました'
  end
end
