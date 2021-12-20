class Owner::SearchController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    @word = params[:word]

    if @range == '1'
      @customers = Customer.search(search,@word)
      @customers.count
      if @customers.count == 0
        render :search
      end
    else
      @items = Item.search(search,@word)
      @items.count
      if @items.count == 0
        render :search
      end
    end
  end
end
