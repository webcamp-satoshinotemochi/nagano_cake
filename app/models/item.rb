class Item < ApplicationRecord

 belongs_to :genre
 has_many :cart_items
 has_many :customers,through: :cart_items

 has_many :order_items
 has_many :orders,through: :order_items

 attachment :image

  def add_tax_price_before_tax
   (self.price_before_tax * 1.1).floor
  end

 validates :name,presence:true
 validates :body,presence:true
 validates :price_before_tax,presence:true

 # ----消費税をもとめるメソッド----
 def with_tax_price
  (price_before_tax * 1.1).floor
 end
 # ------------ここまで------------
 def self.search(search,word)
    if search == "forward"
      @items = Item.where("name LIKE?","#{word}%")
    elsif search =="partial"
      @items = Item.where("name LIKE?","%#{word}%")
    else
      @items = Item.all
    end
 end

end
