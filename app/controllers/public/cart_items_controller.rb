class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtoal }
  end

  def create
  end

  def update
  end

  def destory
  end

  def destroy_all
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
