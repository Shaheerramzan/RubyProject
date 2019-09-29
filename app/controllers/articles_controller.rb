class ArticlesController < ApplicationController
  def new
    @article = Article.new
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
  private

  def article_data
    params.require(:article).permit(:title, :description)
  end
end