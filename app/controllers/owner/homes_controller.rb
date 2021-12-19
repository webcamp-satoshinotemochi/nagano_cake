class Owner::HomesController < ApplicationController
before_action :authenticate_owner!
#管理者でないとログイン画面に遷移

def top
    @orders = Order.all
    @orders = Order.page(params[:page]).reverse_order
end

end
