class Owner::OrderItemsController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

  def update
  end

end
