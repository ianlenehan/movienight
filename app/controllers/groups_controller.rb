class GroupsController < ApplicationController

  before_action :authorise, :only => [:index]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    # group_name = params[:name]
    req = Cloudinary::Uploader.upload( params[:group][:image] ) if params[:group][:image]
    @group = Group.create group_params
    if req
      @group.image = req["url"]
    end
    if @group.save
      @current_user.group_id = @group.id
      @current_user.group_admin = true
      @current_user.group_member = true
      @current_user.save
      redirect_to @group
    else
      render :new
    end

  end


  def show
    @group = Group.find params[:id]
    @events = Event.all.order('date DESC')
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    req = Cloudinary::Uploader.upload( params[:group][:image] )
    group = Group.find params[:id]
    group.image = req["url"]
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
    if @current_user.group_admin
      @current_user.group_admin = false
    end
    @current_user.group_member = false
    @current_user.group_id = nil
    @current_user.save
    redirect_to root_path
  end

  def make_admin
    user = User.find params[:user]
    group = Group.find params[:id]
    user.group_admin = true
    user.save
    redirect_to group
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def authorise
    redirect_to root_path unless (@current_user.present? && @current_user.admin?)
  end
end
