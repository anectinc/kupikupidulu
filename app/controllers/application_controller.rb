# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_popular_articles

  protected

  def set_popular_articles
    @popular_articles = Article.by_popularity
  end
end
