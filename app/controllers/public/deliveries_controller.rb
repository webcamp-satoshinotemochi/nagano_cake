class Public::DeliveriesController < ApplicationController

def index
  @delivery = Delivery.new
  @deliveries = current_customer.deliveries
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
    params.require(:delivery).permit(:post_address, :address, :name)
  end


end
