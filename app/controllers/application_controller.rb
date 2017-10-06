class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login

  private

  def require_access
    unless session[:access] == true 
      redirect_back fallback_location: root_path
    end 
  end


  def require_login
    unless logged_in?
      
      sweetalert_warning('You must be logged in to access this section', title = 'Error', opts = {})
      redirect_to login_url # halts request cycle
    end
  end

  def require_student
    unless student?
      sweetalert_warning('You must be a student to access this section', title = 'Error', opts = {})
      redirect_back fallback_location: root_path
    end
  end  

  def require_teacher
    unless teacher?
      sweetalert_warning('You must be a teacher to access this section', title = 'Error', opts = {})
      redirect_back fallback_location: root_path
    end
  end

  def require_sadmin
    unless superadmin?
      sweetalert_warning('You must be a super admin to access this section', title = 'Error', opts = {})
      redirect_back fallback_location: root_path
    end
  end  

  def isme(id)
    unless id == current_user.id 
      flash[:error] = "You must be a super admin to access this section"
      redirect_back fallback_location: root_path
    end
  end

  def redirect_to_back_or_default(default = root_url)
  if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
    redirect_to :back
  else
    redirect_to default
  end
end 
end
