class PagesController < ApplicationController
  def main
    @articles = Article.public
    @popular_articles = Article.public.limit(10)
  end

  def contact
    @contact = Contact.new
  end
end
