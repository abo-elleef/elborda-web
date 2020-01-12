class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.all
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
    respond_to do |format|
      format.html {
        home
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
    @poem = Poem.where("id > ?", params[:id]).limit(1).first
    render :show
  end

  def previous
    @poem = Poem.where("id < ?", params[:id]).limit(1).first
    render :show
  end

  # GET /poems/new
  def new
    @poem = Poem.new
  end

  # GET /poems/1/edit
  def edit
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = Poem.new(poem_params)

    respond_to do |format|
      if @poem.save
        format.html { redirect_to @poem, notice: 'Poem was successfully created.' }
        format.json { render :show, status: :created, location: @poem }
      else
        format.html { render :new }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poems/1
  # PATCH/PUT /poems/1.json
  def update
    respond_to do |format|
      if @poem.update(poem_params)
        format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem.destroy
    respond_to do |format|
      format.html { redirect_to poems_url, notice: 'Poem was successfully destroyed.' }
      format.json { head :no_content }
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
