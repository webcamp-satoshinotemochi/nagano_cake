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
    @total_price_except_postage = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @amount_claimed = @total_price_except_postage + @order.postage

    if params[:order]
      @order.post_address = current_customer.post_address
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save
      current_customer.cart_items.each do |c|
        OrderItem.create(order_id: order.id, item_id: c.item_id, order_quantity: c.quantity, price_after_tax: c.item.with_tax_price)
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_thank_path
    else
      redirect_to action: new
    end
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
