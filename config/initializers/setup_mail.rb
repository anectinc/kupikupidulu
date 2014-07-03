ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'kupikupidulu.sakura.ne.jp',
  port: 587,
  authentication: :login,
  user_name: 'webmaster@kupikupidulu.com',
  openssl_verify_mode: 'none',
  password: 'Kupi2dulu',
}
