require "json"
require "open-uri"

class ListsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = Bookmark.where(list_id: @list.id)
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end


  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_id
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def fetch_movies
    url = "https://tmdb.lewagon.com/movie/top_rated"
    movies_serialized = URI.open(url).read
    @movies = JSON.parse(movies_serialized)
  end


end
