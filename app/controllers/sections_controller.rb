class SectionsController < ApplicationController
  # before_action :add_default_breadcrumb
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  def index
    @sections = Section.all.page(params[:page]).per(10)
    @section = params[:section] ? Section.find(params[:section]) : Section.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @section = Section.new
  end

  def show
  end

  def edit
  	redirect_to sections_path(section: @section.id)
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section successfully created"
      redirect_to sections_path
    else
      flash[:error] = "Something went wrong"
      render sections_path
    end
  end

  def update
  	if @section.update_attributes(section_params)
      flash[:notice] = 'Group successfully updated'
      redirect_to sections_path
    else
      flash[:error] = "Something went wrong"
      redirect_to sections_path
    end
  end

  private

  def section_params
    params.require(:section).permit(:name, :course_id)
  end
  def set_section
  	@section = Section.find(params[:id])
  end
end
