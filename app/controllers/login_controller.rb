class LoginController < ApplicationController
  def parent_login
    if request.post?
      parent = Parent.find_by_email(params[:email].downcase)
      if parent && parent.authenticate(params[:password])
        make_session(parent)
        redirect_to parents_path
      else
        flash.now[:notice] = 'Invalid email/password combination'
        render 'parent_login'
      end
    end
  end

  def student_login
    if request.post?
      student = Student.find_by_email(params[:email].downcase)
      if student && student.authenticate(params[:password])
        make_session(student)
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
        make_session(teacher)
        redirect_to teachers_path
      else
        flash.now[:notice] = 'Invalid email/password combination'
        render 'teacher_login'
      end
    end
  end

  def logout
  end


  private

  def make_session(user)
    session[:user_id] = user.id
  end

end
