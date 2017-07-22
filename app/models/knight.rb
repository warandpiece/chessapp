class Knight < Piece
  # KNIGHTS MOVE IN AN 'L' SHAPE FOR A TOTAL OF 8 POSSIBLE SQUARES
  def valid_move_knight?(destination_x, destination_y)
    destination_x.between?(0, 7) && destination_y.between?(0, 7) &&
    ((self.current_position_x - destination_x).abs == 2 &&
          (self.current_position_y - destination_y).abs == 1) ||
    ((self.current_position_x - destination_x).abs == 1 &&
          (self.current_position_y - destination_y).abs == 2)
  end
end