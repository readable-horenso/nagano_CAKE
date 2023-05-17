class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      # カラム追加
     t.integer :customer_id, null: false
     t.string :name, null: false
     t.string :postcode, null: false
     t.string :address, null: false
     t.integer :payment_method, null: false, default: 0
     t.integer :total_amount, null: false
     t.integer :postage, null: false, default: 800
     t.integer :status, null: false, default: 0
     t.timestamps
    end
  end
end
