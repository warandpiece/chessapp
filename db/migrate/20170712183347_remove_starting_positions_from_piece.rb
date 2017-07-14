class RemoveStartingPositionsFromPiece < ActiveRecord::Migration[5.0]
  def change
    remove_column :pieces, :starting_position_x
    remove_column :pieces, :starting_position_y
  end
end