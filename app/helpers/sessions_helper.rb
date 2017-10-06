module SessionsHelper
	# Logs in the given user.
  def log_in(user, status)
  	if status == "3"
    session[:student_id] = user.id
    else
    session[:teacher_id] = user.id	
    
    end
    session[:status] = status
  end
   # Returns the current logged-in user (if any).
  def current_user
  	if session[:status] == "3"
      @current_user ||= Student.find_by(id: session[:student_id])
    elsif session[:status] == "2" || session[:status] == "1"
      @current_user ||= Teacher.find_by(id: session[:teacher_id])

    else
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def teacher?
    !session[:teacher_id].nil?
  end

  def student?
    !session[:student_id].nil?
  end

  def superadmin?
    !session[:teacher_id].nil? && session[:status] == "1"
  end

  # Logs out the current user.
  def log_out
  	if session[:status] == "3"
    session.delete(:student_id)
    else
    session.delete(:teacher_id)
    @current_user = nil
    end
  end


end
