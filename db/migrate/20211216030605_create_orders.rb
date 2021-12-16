class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id,null: false
      t.integer :postage,null: false
      t.integer :amount_claimed,null: false
      t.integer :order_status,default: 0,null: false
      t.integer :pay_method,default: 0,null: false
      t.string :post_address,null: false,default: ""
      t.string :address,null: false,default: ""
      t.string :name,null: false,default: ""
      
      t.timestamps
    end
  end
end
