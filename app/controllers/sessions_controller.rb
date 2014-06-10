class SessionsController < ApplicationController

  def new
  end

  def create
  	# TODO: Fix messaging system. 
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_back_or username_url(user.user_alias)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	if !current_user.nil?
    	sign_out
    end
    redirect_to root_url
  end
end
