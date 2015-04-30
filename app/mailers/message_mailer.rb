class MessageMailer < ApplicationMailer
  default from: "no-reply@gradezilla.com"
  default to: "camillavk@gmail.com"

  def new_message(message)
    @message = message
    mail(subject: "#{message.title}")
  end
end
