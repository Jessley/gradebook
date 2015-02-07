class TeachersController < ApplicationController
  before_action :authenticate_user
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    if session[:user_type]== "teacher"
      @teacher = Teacher.new
    else
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path, notice: "Teacher was successfully created"
    else
      render :new, notice: "Try again"
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if session[:user_type] != "teacher"
      redirect_to root_path, notice: "You must be a teacher to see that page"
    else
      @teacher.destroy
      redirect_to teacher_path, notice: 'Teacher was successfully destroyed.'
    end
  end

  def edit
  end


private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end





end
