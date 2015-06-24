class ArticlesController < ApplicationController
  before_action :set_article, except: :index

  def index
    @articles = Article.public.page(params[:page]).includes(:media)
  end

  def show
    @article.increment_accesees_count
    @related_articles = @article.category.articles.public.where.not(id: @article).limit(4).includes(:media)
  end

  def tweet
    @article.increment_tweeted_count
    @article.increment_accesees_count
    redirect_to @article
  end

  def share
    @article.increment_shared_count
    @article.increment_accesees_count
    redirect_to @article
  end

  private

  def set_article
    @article = Article.public.find(params[:id])
  end
end
