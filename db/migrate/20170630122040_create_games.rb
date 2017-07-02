class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :white_player
      t.integer :black_player
      t.integer :game_status_id
      t.timestamps :timestamp_start
      t.timestamps :timestamps_end
    end
  end
end