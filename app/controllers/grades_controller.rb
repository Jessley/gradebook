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
    @grade = Grade.new
  end

  def destroy
  end

  def edit
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
