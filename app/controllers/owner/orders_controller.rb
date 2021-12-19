class Owner::OrdersController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    
    @total_price_except_postage = @order_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
      if @order.payment_finish?
      @order.order_items.each do |order_item|
      order_item.waiting!
      end
      end
    redirect_to owner_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end