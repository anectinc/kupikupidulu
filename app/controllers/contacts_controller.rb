# coding: utf-8
class ContactsController < ApplicationController
  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver
      redirect_to root_url, notice: 'Success!'
    else
      render 'pages/contact'
    end
  end

  private

  def contact_params
    params.require(:contact).permit :name, :email, :medium1, :medium2, :content
  end
end
