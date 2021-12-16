class Delivery < ApplicationRecord
  
  belongs_to :customer
  validates :post_address,presence:true
  validates :address,presence:true
  validates :name,presence:true
end
