class Item < ApplicationRecord
  
 belongs_to :genre
 has_many :cart_items
 has_many :customers,through: :cart_items
 
 has_many :order_items
 has_many :orders,through: :order_items
 
 attachment :image

 validates :name,presence:true
 validates :body,presence:true
 validates :price_before_tax,presence:true
 
 def plus_tax_price
   (self.price*1.1).round
 end
 
end
