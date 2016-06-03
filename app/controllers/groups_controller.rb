# Groups controller
class GroupsController < ApplicationController
  before_action :add_default_breadcrumb
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.accessible_by(current_ability)
    @group = params[:group] ? Group.find(params[:group]) : Group.new
    @group_errors = params[:group_err]

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def show
    @contacts = @group.contacts
  end

  def edit
    redirect_to groups_path(group: @group.id)
  end

  def create
  @group = Group.new(group_params)
  @group.user = current_user
  if @group.save
    flash[:notice] = "Group successfully created"
    redirect_to groups_path
  else
    flash[:error] = "Something went wrong"
    group_errors = @group.errors.full_messages
    redirect_to groups_path(group: @group, group_err: group_errors)
  end
  end

  def update
    if @group.update_attributes(group_params)
      flash[:notice] = 'Group successfully updated'
      redirect_to groups_path
    else
      flash[:error] = "Something went wrong"
      redirect_to groups_path
    end
  end

  def destroy
    @group.destroy
    flash[:warning] = "Group successfully deleted."
    redirect_to groups_path
  end
  private
  
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params 
    params.require(:group).permit(:name)
  end

end
