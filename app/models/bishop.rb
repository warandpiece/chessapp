class Bishop < Piece
  # BISHOPS CAN MOVE DIAGONALLY MULTIPLE SQUARES
  def valid_move_bishop?(destination_x, destination_y)
    return false if valid_move?(destination_x, destination_y) == false
    (self.current_position_x - destination_x).abs ==
         (self.current_position_y - destination_y).abs
  end
end