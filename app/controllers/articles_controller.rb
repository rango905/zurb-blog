class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    if params[:keyword]
      @articles = Article.where( [ "title like ? OR text like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ] )
    else
      @articles = Article.all
    end
    @tags = KeywordTag.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :name, :keyword_tags, :keyword_tags_id)
    end
end
