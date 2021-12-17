class Owner::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to owner_items_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def  update
    @item = Item.find(params[:id])
    if @item.update
    redirect_to owner_items_path(@item)
    else
    render edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :body, :price_before_tax, :image, :is_active)
  end

end

