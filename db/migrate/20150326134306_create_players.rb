class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :last_name
      t.string :first_name
      t.string :name, index: true
      t.decimal :place, index: true
      t.decimal :chances, index: true

      t.timestamps null: false
    end
  end
end
