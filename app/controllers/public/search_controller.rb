class Public::SearchController < ApplicationController
  def search
    search = params[:search]
    @word = params[:word]

    @items = Item.search(search,@word)
    @items.count
    if @items.count == 0
      render :search
    end
  end
end
