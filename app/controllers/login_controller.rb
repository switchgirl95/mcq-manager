class LoginController < ApplicationController
  def verify

  	@user = User.new(user_params)
  end
  def user_params
      params.require(:user).permit(:username, :password)
    end
end
