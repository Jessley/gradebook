class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    if session[:user_id]== nil
      flash[:notice] = "You must log in to see that page"
      redirect_to(:controller => 'login', :action => 'index')
      return false
    end
  end
end
