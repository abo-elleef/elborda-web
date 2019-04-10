class ApplicationController < ActionController::Base

	def home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).all
		@poem = @poems.find(params[:id] || 7)
		render 'layouts/home'
	end
end
