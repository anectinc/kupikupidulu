# coding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_popular_articles

  protected

  def set_popular_articles
    @popular_articles = Article.by_popularity.includes(:media)
  end
end
