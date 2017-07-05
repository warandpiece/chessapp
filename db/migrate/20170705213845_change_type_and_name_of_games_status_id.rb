class ChangeTypeAndNameOfGamesStatusId < ActiveRecord::Migration[5.0]
  def change
    rename_column :games, :game_status_id, :game_status
    change_column :games, :game_status, :string
  end
end
