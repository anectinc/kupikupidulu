class ArticlesController < ApplicationController
  before_action :set_article, except: :index

  def index
    @articles = Article.public.page(params[:page]).includes(:media)
  end

  def show
    @related_articles = @article.category.articles.limit(4).includes(:media)
  end

  def tweet
    @article.increment_tweeted_count
    zincrement
    redirect_to @article
  end

  def share
    @article.increment_shared_count
    zincrement
    redirect_to @article
  end

  private

  def set_article
    @article = Article.public.find(params[:id])
  end

  def zincrement
    REDIS.zincrby(Date.today.to_s, 1, @article.id)
  end
end
