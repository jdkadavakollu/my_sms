class GroupsController < ApplicationController
  before_action :set_group,only: [:show, :edit]
  def index
    @groups = Group.accessible_by(current_ability)
    @new_group = Group.new 
    #binding.pry

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def edit
  end

  def create
  @group = Group.new(group_params)
  @group.user = current_user
  if @group.save
    flash[:notice] = "Group successfully created"
    redirect_to groups_path
  else
    binding.pry
    redirect_to groups_path(new_group: @group)
  end
  end

  def update
  end

  private
  
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params 
    params.require(:group).permit(:name)
  end

end
