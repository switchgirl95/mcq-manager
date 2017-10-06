class SessionsController < ApplicationController
	skip_before_action :require_login
  layout 'no_menu'
  
  def new
    render :layout => 'no_menu'
  end
   def create

    status = params[:session][:status]

    if status == "3"

        user = Student.find_by(matricule: params[:session][:name])
        if user.nil?
          #flash[:danger] = 'Invalid email/password combination' # Not quite right!
          sweetalert_warning('Invalid email/password combination', title = 'Login error', opts = {})
          # Create an error message.
          render 'new'
        else
          if user.password == params[:session][:password]
            log_in user, params[:session][:status]
            sweetalert_success(user.nom + ' ' + user.prenoms, title = 'Welcome!', opts = {}) 
            redirect_to '/mysubjects'
          	# Log the user in and redirect to the user's show page.
          else

          	sweetalert_warning('Invalid email/password combination', title = 'Login error', opts = {}) # Not quite right!
            # Create an error message.
            render 'new'
          end
        end

    elsif status == "2"
        user = Teacher.find_by(nom: params[:session][:name])
        if user.nil?
          #flash[:danger] = 'Invalid email/password combination' # Not quite right!
          sweetalert_success(user.nom + ' ' + user.prenoms, title = 'Welcome', opts = {})
          # Create an error message.
          render 'new'
        else
          if user.password == params[:session][:password]
            log_in user, params[:session][:status]
            sweetalert_info(user.nom + ' ' + user.prenoms , title = 'Welcome!', opts = {})
            
            redirect_to '/mytests'
            # Log the user in and redirect to the user's show page.
          else
            #flash[:danger] = 'Invalid email/password combination' # Not quite right!
            sweetalert_warning('Invalid email/password combination!', title = 'Login error', opts = {})
            #sweetalert_success('Your resource is created and available.', 'Successfully created', persistent: 'Awesome!')
            # Create an error message.
            render 'new'
          end
      end
    elsif status == "1"
        user = Teacher.find(1)
        if user.nil?
          #flash[:danger] = 'Invalid email/password combination' # Not quite right!
          
          # Create an error message.
          render 'new'
        else
          if user.password == params[:session][:password]
            log_in user, params[:session][:status]
            sweetalert_info(user.nom + ' ' + user.prenoms, title = 'Welcome!', opts = {})
            
            redirect_to '/mytests'
            # Log the user in and redirect to the user's show page.
          else
            sweetalert_warning('Invalid email/password combination!', title = 'Login error', opts = {}) # Not quite right!

            # Create an error message.
            render 'new'
          end 
        end   
    else
        sweetalert_warning('Select status first!', title = 'Login error', opts = {}) # Not quite right!
          # Create an error message.
          render 'new'
    end
   end

  def destroy
  	log_out
    redirect_to root_url
  end
end
