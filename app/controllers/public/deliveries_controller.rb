class Public::DeliveriesController < ApplicationController

def index
end

def create
end

def destroy
end

def edit
end

def update
end

private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :post_address, :address, :name)
  end


end
