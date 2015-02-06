class TeachersController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def new
    if @current_user== "teacher"
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
  end

  def destroy
  end

  def edit
  end


private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end





end
