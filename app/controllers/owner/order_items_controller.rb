class Owner::OrderItemsController < ApplicationController
  before_action :authenticate_owner!
  #管理者でないとログイン画面に遷移

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
    @order_item.update(order_item_params)
    if @order_item.working?
       @order.production!
    elsif @order_items.count == @order_items.complete.count
      @order.ready_to_delivery!
    end
    redirect_to owner_order_path(@order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:product_status)
  end

end