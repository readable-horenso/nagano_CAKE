class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
     # カラム追加
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.boolean :is_valid, null: false, default: true
      t.timestamps
    end
  end
end
