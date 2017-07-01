class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.integer :move_count
      t.string :moves_taken, array: true, default: []
      t.timestamps
    end
  end
end
