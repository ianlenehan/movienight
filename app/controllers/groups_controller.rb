class GroupsController < ApplicationController

  before_action :authorise, :only => [:index]

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
    @events = Event.all
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    group = Group.find params[:id]
    group.update group_params
    redirect_to group
  end

  def search
    @name = params[:name]
    @group_search = Group.where("name like ?", "%#{@name}%")
  end

  def search_index
  end

  def join
    @group = Group.find params[:id]
    @current_user.group_id = @group.id
    @current_user.group_member = false
    @current_user.save
    redirect_to @group
  end

  def accept_member
    user = User.find params[:id]
    user.group_member = true
    user.save
    redirect_to "/groups/#{@current_user.group_id}"
  end

  def reject_member
    user = User.find params[:id]
    user.group_member = nil
    user.save
    redirect_to "/groups/#{@current_user.group_id}"
  end

  def leave_group
    group = Group.find params[:id]
    group.users.delete(@current_user)
    @current_user.group_member = false
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :image)
  end

  def authorise
    redirect_to root_path unless (@current_user.present? && @current_user.admin?)
  end
end
