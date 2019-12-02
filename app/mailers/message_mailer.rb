class MessageMailer < ApplicationMailer
  default from: 'Сообщение с сайта ГЕЙЗЕР <geyzer.shop@yandex.ru>'

  def order_email(message)
    @message = message
    mail(to: 'geyzer.shop@yandex.ru, geyzer-st@yandex.ru', subject: "Сообщение с сайта ГЕЙЗЕР <geyzer.shop@yandex.ru>" )
  end
end
