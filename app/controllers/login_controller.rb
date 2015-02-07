class LoginController < ApplicationController

  def new
    if session[:user_type] == "teacher"
      redirect_to students_path
    elsif session[:user_type] == "student"
      redirect_to grades_path
    elsif session[:user_type] == "parent"
      redirect_to grades_path
    end

  end

  def create
    user = find_teacher || find_student || find_parent
    if find_teacher
      user_type = "teacher"
    elsif find_student
      user_type= "student"
    elsif find_parent
      user_type= "parent"
    end
    if user && user.authenticate(params[:password])
      make_session(user, user_type)
      if session[:user_type] == "teacher"
        redirect_to teachers_path
      elsif session[:user_type] == "student" || session[:user_type] == "parent"
        redirect_to grades_path
      end
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def logout
    session[:user_id] = nil
    session[:user_type]= nil
    redirect_to login_new_path
  end

  def profile
    if session[:user_id] && session[:user_type] == "teacher"
      redirect_to edit_teacher_path(session[:user_id])
    elsif session[:user_id] && session[:user_type] == "parent"
      redirect_to edit_parent_path(session[:user_id])
    elsif session[:user_id] && session[:user_type] == "student"
      redirect_to edit_student_path(session[:user_id])
    else
      redirect_to root_path, notice: "Please log in to see this page."
    end
  end


  private

  def make_session(user,user_type)
    session[:user_id] = user.id
    session[:user_type]= user_type
  end


end
