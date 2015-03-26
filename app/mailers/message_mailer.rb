class MessageMailer < ApplicationMailer
  default from: "no-reply@gradezilla.com"
  default to: "camilla@gradezilla.com"

  def new_message(message)
    @message = message
    mail(subject: "New Message: #{message.title}")
  end
end
