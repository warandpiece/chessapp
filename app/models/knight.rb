class Knight < Piece
  def valid_move_knight?(destination_x, destination_y)
    return false if valid_move?(destination_x, destination_y) == false
    ((self.current_position_x - destination_x).abs == 2 &&
          (self.current_position_y - destination_y).abs == 1) ||
    ((self.current_position_x - destination_x).abs == 1 &&
          (self.current_position_y - destination_y).abs == 2)
  end
end