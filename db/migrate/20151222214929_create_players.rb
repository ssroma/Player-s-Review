class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :feature
      t.text :description
      t.integer :time_id

      t.timestamps null: false
    end
  end
end
