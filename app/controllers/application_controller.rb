class ApplicationController < ActionController::Base
  before_action :authenticate_user
  include ApplicationHelper
  include Pagy::Backend

  def home
    @poems = Poem.includes(:links, {chapters: [:lines, :links]}).where(published: true).all
    @poem ||= params[:id].present? ? @poems.find(params[:id]) : @poems.sample
    respond_to do |format|
      format.html do
        render 'layouts/home'
      end
      format.json do
        hash = {poems: @poems.map { |poem| PoemIndexPresenter.new(poem).to_json}, poem_of_day: PoemShowPresenter.new(@poem).to_json}
        render json: JSON.generate(hash), status: :ok
      end
    end
  end


  def awrad
    @werds = Werd.all
    respond_to do |format|
      format.html do
        @header = 'أوراد البرهامية'
        render 'layouts/awrad'
      end
      format.json do
        werds_json = @werds.map  { |werd| WerdPresenter.new(werd).to_json }
        render json: werds_json , status: :ok
      end
    end
  end

  def show
    @werd = Werd.find_by(name: params[:name])
    respond_to do |format|
      format.html do
        @header = 'أوراد البرهامية' + ": " + @werd.name
        render 'layouts/awrad_show'
      end
      format.json do
        render json: WerdPresenter.new(@werd).to_json, status: :ok
      end
    end

  end

  def grid_home
    respond_to do |format|
      @pagy, @poems = pagy(Poem.includes(:links, {chapters: [:lines, :links]}).published.order(id: :asc))
      format.html do
        render 'layouts/grid_home'
      end
      format.json do
        @poems = Poem.published.order(id: :asc)
        poems_array = @poems.map { |poem| PoemIndexPresenter.new(poem).to_json}
        render json: JSON.generate(poems_array), status: :ok
      end
    end
  end

  def mobile
    @poems = Poem.includes(:links, {chapters: [:lines, :links]}).where(published: true).order(:id).all
    body = {}
    @poems.map { |p| body[p.id] = MobilePresenter.new(p).present }
    render json: JSON.generate(body), status: :ok
  end

  def privacy
    render 'layouts/privacy'
  end


  def authenticate_user
    true
  end

  def set_related_poems
    @related_poems = Poem.published.where.not(id: @poem.id).order("RANDOM()").limit(10)
  end
end
