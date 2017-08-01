class King < Piece
  # KINGS CAN MOVE ONE SQUARE IN ANY DIRECTION

  def valid_move?(destination_x, destination_y)
    return false if super(destination_x, destination_y) == false
    (self.current_position_x - destination_x).abs <= 1 && 
         (self.current_position_y - destination_y).abs <= 1
  end
end