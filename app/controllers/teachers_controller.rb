class TeachersController < ApplicationController
  def index
  end

  def new
    @teacher = Teacher.new
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
