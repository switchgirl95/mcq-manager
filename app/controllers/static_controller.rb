class StaticController < ApplicationController
	skip_before_action :require_login
	
def choice
	render :layout => 'no_menu'
end
def about
	render :layout => 'no_menu'
end
def admin_zone
 end
end
