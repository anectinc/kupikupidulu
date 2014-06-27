class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def index
    @articles = Article.public
  end

  def show
  end

  private

  def set_article
    @article = Article.public.find(params[:id])
  end
end
