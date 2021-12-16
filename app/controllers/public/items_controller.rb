class Public::ItemsController < ApplicationController

  def index
    @total_items = Item.all
    @items = Item.page(params[:page]).reverse_order
    @genres = ItemGenre.all
  end

  def show
  end
end
