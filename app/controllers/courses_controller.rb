class CoursesController < ApplicationController
  before_action :course_params, only: [:create, :update]
  def index
    @course = Course.new
    @courses = Course.all

    respond_to do |format| 
      format.html
      format.js
    end
  end

  def new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect :back
    else
      redirect :back
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(course_params)
      flash[:notice] = "Class created successfully"
      redirect_to courses_path
    else
    	binding.pry
      redirect_to :back
    end
  end

  def destroy
    @course.destroy
    flash[:warning] = "Group successfully deleted."
    redirect_to groups_path
  end

  private

  def set_course
  	@course = Course.find(params[:id])
  end

  def course_params
  	params.require(:course).permit(:name)
  end
end
