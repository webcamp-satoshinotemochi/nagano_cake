class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  has_many :items,through: :order_items

  enum pay_method: { credit_card: 0, transfer: 1 }
  enum order_status: { payment_waiting: 0, payment_finish: 1, production: 2, ready_to_delivery: 3, delivery_finish: 4 }
  validates :post_address,presence:true
  validates :address,presence:true
  validates :name,presence:true

  def sum_order_price
    total_price+postage
  end

   def with_tax_price
  (price_before_tax * 1.1).floor
   end


end
