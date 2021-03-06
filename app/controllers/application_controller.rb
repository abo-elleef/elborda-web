class ApplicationController < ActionController::Base
	before_action :authenticate_user

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


	def grid_home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).where(published: true).all.shuffle
		respond_to do |format|
			format.html {
				render 'layouts/grid_home'
			}
			format.json {
				hash = {poems: @poems.map { |poem| PoemIndexPresenter.new(poem).to_json}, poem_of_day: PoemShowPresenter.new(@poem).to_json}
				render json: JSON.generate(hash), status: :ok
			}
		end
	end

	def mobile
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).where(published: true).order(:id).all
		body = {}
		@poems.map do |p| body[p.id] = MobilePresenter.new(p).present end
		render json: JSON.generate(body), status: :ok
	end


	def authenticate_user
    true
	end
end
