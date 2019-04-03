class ApplicationController < ActionController::Base

	def home
		@poems = Poem.includes(:links, {chapters: [:lines, :links]}).all
		@poem = @poems.first
		render 'layouts/home'
	end 
end
