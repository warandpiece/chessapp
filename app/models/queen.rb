class Queen < Piece
  # QUEENS CAN MOVE MULTIPLE SQUARES VERTICALLY, HORIZONTALLY, AND DIAGONALLY
  def valid_move_queen?(destination_x, destination_y)
    return false if valid_move?(destination_x, destination_y) == false
    (self.current_position_x == destination_x ||
          self.current_position_y == destination_y) ||
    ((self.current_position_x - destination_x).abs ==
          (self.current_position_y - destination_y).abs)
  end
end