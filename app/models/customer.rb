class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cart_items
  has_many :items, through: :cart_items
  
  has_many :deliveries
  has_many :orders
  
  validates :family_name,presence:true
  validates :first_name,presence:true
  validates :family_name_kana,presence:true
  validates :first_name_kana,presence:true
  validates :post_address,presence:true,length: { is: 7 }
  validates :family_name,presence:true
  validates :family_name,presence:true

end
