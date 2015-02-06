class GradesController < ApplicationController
  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_path, notice: "Grade was successfully created"
    else
      render :new, notice: "Try again"
    end
  end

  def new
    if @current_user== "teacher"
      @grade = Grade.new
    else
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def destroy
    if @current_user != "teacher"
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def edit
    if @current_user != "teacher"
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def update
  end

  def index
  end

  private
    def grade_params
      params.require(:grade).permit(:grade, :student_id, :date, :grade_type)
    end


end
