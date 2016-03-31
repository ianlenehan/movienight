class UsersController < ApplicationController

  before_action :authorise, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    req = Cloudinary::Uploader.upload( params[:user][:image] )
    @user = User.new user_params
    @user.image = req["url"]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def show
    @user = User.find params[:id]
  end

  def update
    req = Cloudinary::Uploader.upload( params[:user][:image] )
    user = @current_user
    user.image = req["url"] 
    user.update user_params
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name_first, :name_last, :email, :password, :password_confirmation)
  end

  def authorise
    redirect_to root_path unless (@current_user.present? && @current_user.admin?)
  end
end
