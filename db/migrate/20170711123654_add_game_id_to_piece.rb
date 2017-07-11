class AddGameIdToPiece < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :game_id, :integer
  end
end
