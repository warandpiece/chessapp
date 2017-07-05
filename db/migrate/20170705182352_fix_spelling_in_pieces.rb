class FixSpellingInPieces < ActiveRecord::Migration[5.0]
  def change
    rename_column :pieces, :current_postition_y, :current_position_y
  end
end
