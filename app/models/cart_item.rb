class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  # --------小計をもとめるメソッド---------
  def subtotal
    item.with_tax_price*quantity
  end
  # -------------ここまで-------------
end
