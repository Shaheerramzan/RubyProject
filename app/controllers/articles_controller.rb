class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_data)
    if @article.save
      flash[:notice] = 'The article is successfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_data)
      flash[:notice] = 'The article is successfully updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  private

  def article_data
    params.require(:article).permit(:title, :description)
  end
end