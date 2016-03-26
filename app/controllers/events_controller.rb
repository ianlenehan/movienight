class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def edit
  end

  def show
    @event = Event.find params[:id]
    imdb = @event.imdb_id
    @movie = HTTParty.get "http://omdbapi.com?i=#{imdb}"
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
end
