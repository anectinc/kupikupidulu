class PagesController < ApplicationController
  def main
    @articles = Article.public
  end

  def contact
    @contact = Contact.new
  end
end
