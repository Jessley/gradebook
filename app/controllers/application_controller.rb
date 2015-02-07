class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :user_type

  def authenticate_user
    if session[:user_id]== nil
      flash[:notice] = "You must log in to see that page"
      redirect_to(:controller => 'login', :action => 'new')
      return false
    end
  end


  def find_teacher
    Teacher.find_by(email: params[:email].downcase)
  end

  def find_student
    Student.find_by(email: params[:email].downcase)
  end

  def find_parent
    Parent.find_by(email: params[:email].downcase)
  end
end
