class Owner::OrdersController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

  def show
  end

  def update
  end
end
