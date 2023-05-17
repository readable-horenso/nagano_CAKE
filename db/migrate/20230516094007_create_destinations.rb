class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      # カラム追加
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
