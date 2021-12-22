class Owner::GenresController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_back(fallback_location:root_path)
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to owner_genres_path
    else
      redirect_to request.referer
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
