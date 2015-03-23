class MessageMailer < ApplicationMailer
  default from: "no-reply@onlychaos.com"
  default to: "camilla@onlychaos.com"

  def new_message(message)
    @message = message
    mail(subject: "New Message: #{message.title}")
  end
end
