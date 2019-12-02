ActionMailer::Base.default_url_options = { host: 'localhost', port: 3000 }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :tls => true,
  address: 'smtp.yandex.ru',
  port: 465,
  domain: 'yandex.ru',
  authentication: 'plain',
  user_name: 'geyzer.shop@yandex.ru',
  password: Rails.application.secrets.yandex_mail
}