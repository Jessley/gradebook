class StudentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  include StudentsHelper
  def index
    @student= Student.find(session[:user_id])
  end

  def new
    if @current_user== "teacher"
      @student = Student.new
    else
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
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
    if @student.update(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  def edit
  end

private
  def set_student
    @student = Student.find(params[:id])
  end
  def student_params
  params.require(:student).permit(:teacher_id, :name, :email, :password, :parent_id)
  end

end
