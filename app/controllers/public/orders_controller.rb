class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @credit_card = Order.pay_methods.key(0)
    @transfer = Order.pay_methods.key(1)
    @credit_card_ja = Order.pay_methods_i18n[:credit_card]
    @transfer_ja = Order.pay_methods_i18n[:transfer]
    @deliveries = Delivery.where(customer_id:current_customer)
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    @cart_items_total_price = @cart_items.item.all.sum(:subtotal)
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
  end

  def thank
  end

  def index

  end

  def show
  end

private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :amount_claimed, :order_status, :pay_method,:post_address, :address, :name)
  end

end
