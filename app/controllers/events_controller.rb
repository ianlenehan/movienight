class EventsController < ApplicationController

  before_action :authorise, :only => [:index]

  def index
    @events = Event.all.order('date DESC')
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    event = Event.find params[:id]
    event.update event_params
    redirect_to event
  end

  def create
    event = Event.create event_params
    event.group_id = @current_user.group_id
    event.save
    redirect_to event
  end

  def show
    @event = Event.find params[:id]
    imdb = @event.imdb_id
    @movie = HTTParty.get "http://omdbapi.com?i=#{imdb}"
    @ratings = @event.ratings
  end

  def search
    title = params[:title]
    @event_id = params[:id]
    @result = HTTParty.get "http://omdbapi.com?s=#{title}"
  end

  def details
    imdb = params[:imdbid]
    @event_id = params[:id]
    @movie = HTTParty.get "http://omdbapi.com?i=#{imdb}"
  end

  def update_movie
    imdb_id = params[:imdbid]
    @event = Event.find params[:id]
    @event.imdb_id = imdb_id
    @event.save
    redirect_to event_path
  end

  def destroy
    event = Event.find params[:id]
    # @group = Group.find params[:eventid]
    event.destroy
    redirect_to group_path(event.group_id)
  end

  def attending
    event = Event.find params[:id]
    event.users << @current_user
    event.save
    redirect_to event
  end

  def not_attending
    event = Event.find params[:id]
    event.users.delete(@current_user)
    redirect_to event
  end

  def add_rating
    event = Event.find params[:id]
    rated = params[:rated]
    if @current_user.group_id != event.group_id
      redirect_to root_path
    else
      if event.ratings.exists?(user_id: @current_user.id)
        event.ratings.destroy(event.ratings.where(:user_id => @current_user.id))
      end
        rating = Rating.create
        rating.user_id = @current_user.id
        rating.rating_score = rated
        rating.event_id = params[:id]
        rating.save
        redirect_to event
    end
  end

  private
  def event_params
    params.require(:event).permit(:location, :date, :time, :details, :group_id)
  end

  def authorise
    redirect_to root_path unless (@current_user.present? && @current_user.admin?)
  end
end
