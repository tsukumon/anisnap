# Preview all emails at http://localhost:3000/rails/mailers/mail_sender_mailer
class MailSenderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_sender_mailer/inquiry
  def inquiry
    MailSenderMailer.inquiry
  end

end
