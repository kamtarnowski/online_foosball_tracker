class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :last_name
      t.string :first_name
      t.decimal :place
      t.decimal :chances

      t.timestamps null: false
    end
  end
end
