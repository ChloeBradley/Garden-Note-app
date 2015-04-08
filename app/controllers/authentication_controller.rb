class AuthenticationController < ApplicationController
  def new
end

  def create
  user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] ='You have successfully signed in'
      redirect_to user_gardens_path(user)
    else
      flash[:success] = "No digs! That's not a real email and password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
