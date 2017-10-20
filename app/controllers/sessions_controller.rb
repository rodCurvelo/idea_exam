class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash[:error] = 'Invalid Login Credentials'
      #if there is an error, redirect back to login
      redirect_to '/'
    else 
      #sign_in user
      session[:user_id] = user.id
      redirect_to '/ideas'
    end
  end

  def destroy
    #sign_out
    redirect_to '/'
  end
end