class ShortenCoordinates < ActiveRecord::Migration[5.0]
  def change
    rename_column :pieces, :current_position_x, :current_x
    rename_column :pieces, :current_position_y, :current_y
  end
end