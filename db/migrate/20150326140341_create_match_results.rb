class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :winner, index: true
      t.integer :loser, index: true
      t.integer :points, index: true
      t.references :player, index: true
      t.references :match, index: true

      t.timestamps null: false
    end
    add_foreign_key :match_results, :players
    add_foreign_key :match_results, :matches
  end
end
