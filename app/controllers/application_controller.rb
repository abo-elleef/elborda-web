class ApplicationController < ActionController::Base
	before_action :authenticate_user

	def home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).all
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


	def authenticate_user
    true
	end
end
