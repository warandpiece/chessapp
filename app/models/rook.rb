class Rook < Piece
  # ROOKS CAN MOVE MULTIPLE SQUARES VERTICALLY AND HORIZONTALLY
  def valid_move?(destination_x, destination_y)
    return false if super(destination_x, destination_y) == false
    self.current_x == destination_x || self.current_y == destination_y
  end
end