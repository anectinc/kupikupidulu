class PagesController < ApplicationController
  def main
    @articles = Article.public.page params[:page]
  end

  def contact
    @contact = Contact.new
  end
end
