class LoginController < ApplicationController

  def parent_login
    if request.post?
      parent = Parent.find_by_email(params[:email].downcase)
      if parent && parent.authenticate(params[:password])
        make_session(parent, "parent")
        redirect_to parents_path
      else
        flash.now[:notice] = 'Invalid email/password combination'
        render 'parent_login'
      end
    end
  end

  def index

  end

  def student_login
    if request.post?
      student = Student.find_by_email(params[:email].downcase)
      if student && student.authenticate(params[:password])
        make_session(student, "student")
        redirect_to students_path
      else
        flash.now[:notice] = 'Invalid email/password combination'
        render 'student_login'
      end
    end
  end


  def teacher_login
    if request.post?
      teacher = Teacher.find_by_email(params[:email].downcase)
      if teacher && teacher.authenticate(params[:password])
        make_session(teacher, "teacher")
        redirect_to teachers_path
      else
        flash.now[:notice] = 'Invalid email/password combination'
        render 'teacher_login'
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_index_path
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
