class Public::CustomersController < ApplicationController

def mypage
  @customer = current_customer
end

def edit
  @customer = current_customer
end


def unsubscribe
  @customer = current_customer
end

def withdraw
  @customer = current_customer
  @customer.update(is_deleted: true)
  reset_session
  redirect_to root_path
end

def update
  if current_customer.update(customer_params)
    redirect_to mypage_customers_path
  else
    redirect_to request.referer
  end
end

private

  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :post_address, :address, :phone_number, :is_deleted)
  end


end