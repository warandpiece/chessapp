class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :piece_type
      t.string :piece_color
      t.integer :current_position_x
      t.integer :current_postition_y
      t.integer :starting_position_x
      t.integer :starting_position_y
      t.timestamps
    end
  end
end
