class Owner::GenresController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

end
