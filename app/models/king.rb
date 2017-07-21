class King < Piece
  def self.valid_move?(destination_x, destination_y)
    if destination_x < 0 || destination_x > 7 || destination_y < 0 || destination_y > 7
      return false
    elsif is_move_blocked(destination_x, destination_y) == true
      return false
    elsif (self.current_position_x - destination_x).abs <= 1 && 
          (self.current_position_y - destination_y).abs <= 1
      return true
    else 
      return false
    end
  end
end