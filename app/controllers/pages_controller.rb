class PagesController < ApplicationController
  def main
    @articles = Article.public
    @popular_articles = Article.by_popularity.limit(10)
  end

  def contact
    @contact = Contact.new
  end
end
