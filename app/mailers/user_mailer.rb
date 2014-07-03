# coding: utf-8
class UserMailer < ActionMailer::Base
  default from: 'webmaster@kupikupidulu.com'

  def contact_email message
    @message = message
    mail to: 'contact@kupikupidulu.com', subject: '【KUPI KUPI DULU】Contactメッセージが届きました'
  end

  protected

  def mail_with_default_settings headers = {}, &block
    mail_without_default_settings(headers, &block).tap do |mail|
      mail.transport_encoding = '8bit'
    end
  end
  alias_method_chain :mail, :default_settings
end
