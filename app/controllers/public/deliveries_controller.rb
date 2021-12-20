class Public::DeliveriesController < ApplicationController

def index
  @delivery = Delivery.new
  @deliveries = current_customer.deliveries
end

def create
  delivery = Delivery.new(delivery_params)
  delivery.customer_id = current_customer.id
  if delivery.save
    redirect_back(fallback_location:root_path)
  else
    redirect_to request.referer
  end
end

def destroy
  delivery = Delivery.find(params[:id])
  delivery.destroy
  redirect_back(fallback_location:root_path)
end

def edit
  @delivery = Delivery.find(params[:id])
end

def update
end

private

  def delivery_params
    params.require(:delivery).permit(:post_address, :address, :name)
  end


end
