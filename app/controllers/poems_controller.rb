class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  # GET /poems/1
  # GET /poems/1.json
  def show
    @poem = Poem.find(params[:id])
    redirect_to chapter_path(id: @poem.chapters.first.id) if  @poem.chapters.size == 1
    respond_to do |format|
      format.html {
      }
      format.js {
        @poem = Poem.find(params[:id])
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
    @poem = Poem.where("id > ?", params[:id]).first
    respond_to do |format|
      format.html { redirect_to poem_url(id: @poem.id) }
      format.json {
        hash = { poem: PoemShowPresenter.new(@poem).to_json}
        render json: JSON.generate(hash), status: :ok
      }
    end
  end

  def previous
    @poem = Poem.where("id < ?", params[:id]).order("id").last
    respond_to do |format|
      format.html { redirect_to poem_url(id: @poem.id) }
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
