class King < Piece
  # KINGS CAN MOVE ONE SQUARE IN ANY DIRECTION

  def valid_move?(destination_x, destination_y)
    return false if super(destination_x, destination_y) == false
    self.castling?(destination_x, destination_y) ||
    	(self.current_x - destination_x).abs <= 1 && 
         (self.current_y - destination_y).abs <= 1
  end

  def castling?(destination_x, destination_y)
   !self.has_moved? && !rook_moved?(destination_x, destination_y) &&
   		!pieces_between?(destination_x, destination_y) &&
        !check_on_the_way?(destination_x)
  end

  def get_rook(destination_x, destination_y)
    if destination_x == 2
      rook = Piece.find_by(current_x: 0, current_y: destination_y)
    elsif destination_x == 6
      rook = Piece.find_by(current_x: 7, current_y: destination_y)
    end 
    rook
  end

  def rook_moved?(destination_x, destination_y)
    rook = get_rook(destination_x, destination_y)
    return rook.has_moved? if rook
    true
  end

  def pieces_between?(destination_x, destination_y)
    if destination_x == 2
      x = 0
    elsif destination_x == 6
      x = 7
    end
    self.is_move_blocked(x, destination_y)
  end

  def opposite_color
    self.piece_color == "white" ? "black" : "white"
  end

  def get_x_for_check(destination_x)
    if destination_x == 2
      x = 3
    elsif destination_x == 6
      x = 5
    end
    x
  end

  def check_on_the_way?(destination_x)
    game = Game.find(self.game_id)
    opposite_color = self.opposite_color
    x = get_x_for_check(destination_x)
    Piece.where(game_id: game, piece_color: opposite_color).each do |piece|
      return true if piece.valid_move?(x, self.current_y)
    end
    false
  end

end

