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

  def full_address
    '〒'+post_address+' '+address
  end

  def full_name
    family_name+' '+first_name
  end

  def self.search(search,word)
    if search == "forward"
      @customers = Customer.where("family_name LIKE?","#{word}%")
    elsif search =="partial"
      @customers = Customer.where("family_name LIKE?","%#{word}%")
    else
      @customers = Customer.all
    end
  end

end
