class StudentsController < ApplicationController
  before_action :authenticate_user  
  def index
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "Student was successfully created"
    else
      render 'new', notice: "Try again"
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

private
  def student_params
  params.require(:student).permit(:teacher_id, :name, :email, :password, :parent_id)
  end

end
