class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_player, index: true
      t.integer :second_player, index: true

      t.timestamps null: false
    end
  end
end
