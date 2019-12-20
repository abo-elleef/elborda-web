class ApplicationController < ActionController::Base
	before_action :authenticate_user

	def home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).all
		@poem = params[:id].present? ? @poems.find(params[:id]) : @poems.sample
		render 'layouts/home'
	end


	def authenticate_user
    true
	end
end
