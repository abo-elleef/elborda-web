class ApplicationController < ActionController::Base

	def home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).all
		@poem = params[:id].present? ? @poems.find(params[:id]) : @poems.first
		render 'layouts/home'
	end
end
