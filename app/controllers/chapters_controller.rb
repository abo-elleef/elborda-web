class ChaptersController < ApplicationController

  def show
    @chapter = Chapter.find(params[:id])
    @poem = @chapter.poem
  end

  def next
    @chapter = Chapter.where(" id >  #{params[:id]}").first || Chapter.last
    @poem = @chapter.poem
    render :show
  end

  def previous
    @chapter = Chapter.where(" id <  #{params[:id]}").last || Chapter.first
    @poem = @chapter.poem
    render :show
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :poem_id)
    end
end
