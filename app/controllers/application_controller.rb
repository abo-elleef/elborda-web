class ApplicationController < ActionController::Base
	before_action :authenticate_user
	include ApplicationHelper
	include Pagy::Backend

	def home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).where(published: true).all
		@poem ||= params[:id].present? ? @poems.find(params[:id]) : @poems.sample
		respond_to do |format|
			format.html {
				render 'layouts/home'
			}
			format.json {
				hash = {poems: @poems.map { |poem| PoemIndexPresenter.new(poem).to_json}, poem_of_day: PoemShowPresenter.new(@poem).to_json}
				render json: JSON.generate(hash), status: :ok
			}
		end
	end


	def awrad
		respond_to do |format|
			format.html {
				@werds = Werd.all
				render 'layouts/awrad'
			}
			format.json {
				render json: JSON.generate(award_content), status: :ok
			}
		end
	end

	def show
		@werd = Werd.find_by(name: params[:name])
		respond_to do |format|
			format.html {
				render 'layouts/awrad_show'
			}
			format.json {
				render json: JSON.generate(@werd), status: :ok
			}
		end

	end

	def grid_home
		respond_to do |format|
			@pagy, @poems = pagy(Poem.includes(:links, {chapters: [:lines, :links]}).published.order(id: :asc))
			format.html {
				render 'layouts/grid_home'
			}
			format.json {
				@poems = Poem.published.order(id: :asc)
				poems_array = @poems.map { |poem| PoemIndexPresenter.new(poem).to_json}
				render json: JSON.generate(poems_array), status: :ok
			}
		end
	end

	def mobile
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).where(published: true).order(:id).all
		body = {}
		@poems.map do |p| body[p.id] = MobilePresenter.new(p).present end
		render json: JSON.generate(body), status: :ok
	end

	def privacy
		render 'layouts/privacy'
	end


	def authenticate_user
    true
	end

	def set_related_poems
		@related_poems = Poem.published.where.not(id: @poem.id).order("RANDOM()").limit(4)
	end
end
