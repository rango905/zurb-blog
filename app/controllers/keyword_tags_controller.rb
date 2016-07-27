require 'logger'

class KeywordTagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]

  def index
	@tags = KeywordTag.all
  end

  def show
  end
  
  # GET /articles/new
  def new
  end

  def create
    @tag = KeywordTag.where(name: params[:keyword]).take

    if @tag.nil?
      @tag = KeywordTag.create(:name => params[:keyword])
    end

    @ship = ArticleKeywordTagship.new
    @ship.update(:keyword_tag => @tag)
    @ship.update(:article => params[:article])
    @ship.save
    #@article.keyword_tags.create(@tag)
    redirect_to :back
  end

  # DELETE /keyword_tags/1
  # DELETE /keyword_tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to keyword_tags_url, notice: 'Keyword Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = KeywordTag.find(params[:id])
  end	

  def article_params
    params.require(:keyword_tag).permit(:name, :article, :keyword)
  end
end
