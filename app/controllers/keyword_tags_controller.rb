class KeywordTagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]

  def index
	@tags = KeywordTag.all
  end

  def show
  end

  def create
    @tag = KeywordTag.find(params[:name])

    if @tag.nil?
      @tag = Article.new(params[:name])
    end

    @ship = ArticleKeywordTagship.create(@article, @tag)
    @ship.save

    redirect_to back
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
    params.require(:keyword_tag).permit(:name, :article)
  end
end
