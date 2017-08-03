class Bishop < Piece
  # BISHOPS CAN MOVE DIAGONALLY MULTIPLE SQUARES
  def valid_move?(destination_x, destination_y)
    return false if super(destination_x, destination_y) == false
    (self.current_x - destination_x).abs == (self.current_y - destination_y).abs
  end
end