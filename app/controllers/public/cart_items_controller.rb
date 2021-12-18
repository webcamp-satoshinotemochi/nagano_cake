class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.quantity += params[:cart_item][:quantity].to_i
       cart_item.save
       redirect_to cart_items_path
    else
       @cart_item.save
       redirect_to cart_items_path
    end
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
