class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :authenticate_user


  def current_user
  if session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
end


def authenticate_user
  unless current_user
    session[:initial_path] = request.fullpath
   flash[:danger] = "You must sign in"
   redirect_to sign_in_path
  end
end
end
