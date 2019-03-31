class ApplicationController < ActionController::Base

	def home
		@poems = Poem.includes(chapters: :lines).all
		render 'layouts/home'
	end 
end
