class Owner::CustomersController < ApplicationController

before_action :authenticate_owner!
#管理者でないとログイン画面に

def index
  @customers = Customer.page(params[:page]).reverse_order
end

def show
end

def edit
end

def update
end

end
