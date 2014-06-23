class PagesController < ApplicationController
  def main
    @articles = Article.all
  end

  def contact
    @contact = Contact.new
  end
end
