class ParentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_parent, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    if session[:user_type]== "teacher"
      @parent = Parent.new
    else
      redirect_to root_path, notice: "You must be a teacher to see that page"
    end
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to parents_path, notice: "Parent was successfully created"
    else
      render 'new', notice: "Try again"
    end
  end

  def update
    if @parent.update(parent_params)
      redirect_to parents_path, notice: 'Parent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if session[:user_type] != "teacher"
      redirect_to root_path, notice: "You must be a teacher to see that page"
    else
      @parent.destroy
      redirect_to parent_path, notice: 'Parent was successfully destroyed.'
    end
  end

  def edit
  end

  private

    def set_parent
      @parent = Parent.find(params[:id])
    end
    def parent_params
      params.require(:parent).permit(:parent_name, :email, :password, :teacher_id, :child_name)
    end


end
