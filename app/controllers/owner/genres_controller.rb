class Owner::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(genre_params)
  end

  def create

  end

  def update
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
