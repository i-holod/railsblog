class ArticlesController < ApplicationController

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @show_all = Article.order "created_at DESC"
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'update'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:text)
  end
end
