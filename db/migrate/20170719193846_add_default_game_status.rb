class AddDefaultGameStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:games, :game_status, 'Open')
  end
end
