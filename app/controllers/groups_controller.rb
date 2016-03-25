class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.create group_params
    @current_user.group_id = group.id
    @current_user.group_admin = true
    @current_user.save
    redirect_to group
  end


  def show
    @group = Group.find params[:id]
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    group = Group.find params[:id]
    group.update group_params
    redirect_to group
  end

  private
  def group_params
    params.require(:group).permit(:name, :image)
  end
end
