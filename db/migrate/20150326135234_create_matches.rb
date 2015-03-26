class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :first_player, array: true
      t.string :second_player, array: true

      t.timestamps null: false
    end
  end
end
