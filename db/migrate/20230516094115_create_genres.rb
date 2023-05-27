class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      #カラム追加
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
