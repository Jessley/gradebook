class GradesController < ApplicationController
  before_action :authenticate_user
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_path, notice: "Grade was successfully created"
    else
      render :new, notice: "Try again"
    end
  end

  def new
    if session[:user_type]== "teacher"
      @grade = Grade.new
    else
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def destroy
    if session[:user_type] != "teacher"
      redirect_to root_path, notice: "You must be a teacher to see that page"
    else
      @grade.destroy
      redirect_to grades_path, notice: 'Grade was successfully destroyed.'
    end
  end

  def edit
    if session[:user_type] != "teacher"
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def update
    if @grade.update(grade_params)
      redirect_to grades_path, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  def index
  end

  private
    def set_grade
      @grade = Grade.find(params[:id])
    end
    def grade_params
      params.require(:grade).permit(:grade, :student_id, :date, :grade_type)
    end


end
