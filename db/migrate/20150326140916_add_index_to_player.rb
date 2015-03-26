class AddIndexToPlayer < ActiveRecord::Migration
  def change
    add_index :players, :place
  end
end
