class Owner::CustomersController < ApplicationController

before_action :authenticate_owner!
#管理者でないとログイン画面に

def index
  @customers = Customer.page(params[:page]).reverse_order
end

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to owner_customer_path(@customer)
  else
    render :edit
  end
end

private

  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :post_address, :address, :phone_number, :is_deleted)
  end

end