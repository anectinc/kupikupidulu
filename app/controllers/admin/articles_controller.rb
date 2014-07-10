class Admin::ArticlesController < AdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.page(params[:page]).includes(:category)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:category_id, :title, :before_description, :after_description, :source_name, :source_url, :poster_name, :displayable, media_attributes: [:id, :type, :file, :remove_file, :file_cache, :video_code, :description, :_destroy])
  end
end
