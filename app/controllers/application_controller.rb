class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :user_type

  def authenticate_user
    if session[:user_id]== nil
      flash[:notice] = "You must log in to see that page"
      redirect_to(:controller => 'login', :action => 'index')
      return false
    end
  end

  def user_type
    if student_login
      user_type= "student"
    elsif login.teacher_login
      user_type= "teacher"
    elsif login.parent_login
      user_type= "parent"
    end
    return user_type
  end
end
