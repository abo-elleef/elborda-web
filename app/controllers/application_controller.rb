class ApplicationController < ActionController::Base

	def home
		@poems = Poem.includes(chapters: :lines).all
		@poem = @poems.first
		render 'layouts/home'
	end 
end
