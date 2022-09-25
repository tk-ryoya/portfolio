class ContactMailer < ApplicationMailer

  def contact_mail(contact, user)
    @contact = contact
    mail to: user.email, bcc: ENV['ACTION_MAILER_USER'], subject: 'Webサイトより問い合わせが届きました'
  end
end
