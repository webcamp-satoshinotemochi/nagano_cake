class Owner::GenresController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

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
