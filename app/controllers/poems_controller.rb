class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  # GET /poems/1
  # GET /poems/1.json
  def show
    @poem = Poem.find(params[:id])
    set_related_poems
    respond_to do |format|
      format.html {
        if @poem.chapters.size == 1
          @chapter = @poem.chapters.first
          render "chapters/show"
        else
          render :show
        end
      }
      format.js {
        @poem = Poem.find(params[:id])
        set_related_poems
        render :poem_quick_view
      }
      format.json {
        @poem = Poem.find(params[:id])
        hash = { poem: PoemShowPresenter.new(@poem).to_json}
        render json: JSON.generate(hash), status: :ok
      }
    end
  end

  def next
    @poem = Poem.published.where("id > ?", params[:id]).first || Poem.published.last
    set_related_poems
    respond_to do |format|
      format.html {
        if @poem.chapters.size == 1
          @chapter = @poem.chapters.first
          render "chapters/show"
        else
          render :show
        end
       }
      format.json {
        hash = { poem: PoemShowPresenter.new(@poem).to_json}
        render json: JSON.generate(hash), status: :ok
      }
    end
  end

  def previous
    @poem = Poem.published.where("id < ?", params[:id]).order("id").last || Poem.published.first
    set_related_poems
    respond_to do |format|
      format.html {
        if @poem.chapters.size == 1
          @chapter = @poem.chapters.first
          render "chapters/show"
        else
          render :show
        end
       }
      format.json {
        hash = { poem: PoemShowPresenter.new(@poem).to_json}
        render json: JSON.generate(hash), status: :ok
      }
    end
  end

  def poem_quick_view
    respond_to do |format|
      format.html { home }
      format.js { @poem = Poem.includes(:links, {chapters: [:lines, :links]}).find(params[:id]) }
    end
  end

  def search
    @poems = Poem.where("name like ?", "%#{params[:q]}%" )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_params
      params.require(:poem).permit(:name)
    end
end
