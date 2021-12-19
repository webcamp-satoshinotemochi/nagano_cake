class Public::CustomersController < ApplicationController

def mypage
  @customer = current_customer
end

def edit
  @customer = current_customer
end


def unsubscribe
end

def withdraw
end

def update
end

private

  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :post_address, :address, :phone_number, :is_deleted)
  end


end