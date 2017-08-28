class Pawn < Piece
  # PAWNS MOVE ONE OR TWO SQUARES FORWARD ON FIRST MOVE
  # OTHERWISE CAN ONLY MOVE ONE SQUARE FORWARD
  def valid_move?(destination_x, destination_y)
    return false if pawn_valid_move?(destination_x, destination_y) == false
    case
    when self.first_move == "first_move_white"
      (destination_y - self.current_y).between?(1, 2)
    when self.first_move == "first_move_black"
      (self.current_y - destination_y).between?(1, 2)
    when self.pawn_capture_move?(destination_x, destination_y)
      self.capture(destination_x, destination_y)
      true
    when self.piece_color == "white"
      destination_y - self.current_y == 1
    when self.piece_color == "black"
      self.current_y - destination_y == 1 
    else
      false
    end
  end

  # PAWN_VALID_MOVE METHOD

  def pawn_valid_move?(destination_x, destination_y)
    destination_x.between?(0, 7) && destination_y.between?(0, 7) &&
      not_occupied_by_me?(destination_x, destination_y) &&
        (is_move_blocked(destination_x, destination_y) == false || 
            self.pawn_capture_move?(destination_x, destination_y))
  end

  def pawn_coord_for_capture(destination_x, destination_y)
    destination_x > self.current_x ? dir_x = 1 : dir_x = -1
    destination_y > self.current_y ? dir_y = 1 : dir_y = -1
    x = destination_x - dir_x
    y = destination_y - dir_y
    return x,y
  end

  def pawn_capture_move?(destination_x, destination_y)
    ((self.piece_color == "white" && destination_y - self.current_y == 2) ||
        (self.piece_color == "black" && self.current_y - destination_y == 2)) &&
          (destination_x - self.current_x).abs == 2 &&
            self.is_diagonal_move_blocked(destination_x, destination_y)  
  end

  def first_move
    return "first_move_white" if self.piece_color == "white" && self.current_y == 1
    return "first_move_black" if self.piece_color == "black" && self.current_y == 6
  end

  def promote(type="Queen")
    self.piece_type = type if 
      (self.piece_color == "white" && self.current_y == 7) ||
      (self.piece_color == "black" && self.current_y == 0)
  end
end