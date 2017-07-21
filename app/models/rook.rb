class Rook < Piece
  def valid_move_rook?(destination_x, destination_y)
    return false if valid_move?(destination_x, destination_y) == false
    self.current_position_x == destination_x ||
         self.current_position_y == destination_y
  end
end