class ParentsController < ApplicationController
  def index
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to parents_path, notice: "Parent was successfully created"
    else
      render 'new', notice: "Try again"
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private
    def parent_params
      params.require(:parent).permit(:parent_name, :email, :password, :teacher_id, :child_name)
    end


end
