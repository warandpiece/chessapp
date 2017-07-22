class Pawn < Piece
  # PAWNS MOVE ONE OR TWO SQUARES FORWARD ON FIRST MOVE
  # OTHERWISE CAN ONLY MOVE ONE SQUARE FORWARD
  def valid_move_pawn?(destination_x, destination_y)
    return false if valid_move?(destination_x, destination_y) == false
    case
    when self.first_move == "first_move_white"
      (destination_y - self.current_position_y).between?(1, 2)
    when self.first_move == "first_move_black"
      (self.current_position_y - destination_y).between?(1, 2)
    when self.piece_color == "white"
      destination_y - self.current_position_y == 1
    when self.piece_color == "black"
      self.current_position_y - destination_y == 1 
    else
      false
    end
  end

  def first_move
    return "first_move_white" if self.piece_color == "white" && self.current_position_y == 1
    return "first_move_black" if self.piece_color == "black" && self.current_position_y == 6
  end
end