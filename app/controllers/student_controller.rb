class StudentController < ApplicationController
	skip_before_action :require_login

	def index
		
		@toto = session[:status]
	end
end
