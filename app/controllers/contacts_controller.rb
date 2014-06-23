# coding: utf-8
class ContactsController < ApplicationController
  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      UserMailer.contact_email @contact
      redirect_to root_url, notice: 'メッセージを送信しました'
    else
      render 'pages/contact'
    end
  end

  private

  def contact_params
    params.require(:contact).permit :name, :email, :content
  end
end
