class Owner::ItemsController < ApplicationController
  before_action :authenticate_owner!
　#管理者でないとログイン画面に遷移

  def index
  end

  def new
  end

  def show
  end

  def edit
  end
end
