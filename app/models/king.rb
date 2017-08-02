require 'pry'
class King < Piece
  # KINGS CAN MOVE ONE SQUARE IN ANY DIRECTION

  def valid_move?(destination_x, destination_y)
    return false if super(destination_x, destination_y) == false
    self.castling(destination_x, destination_y) ||
    (self.current_position_x - destination_x).abs <= 1 && 
         (self.current_position_y - destination_y).abs <= 1
  end

  def castling(destination_x, destination_y)
  	#binding.pry
  	if !self.has_moved?
  	#	binding.pry
			if self.piece_color == "black"
		#		binding.pry
				if destination_x == 2
		#			binding.pry
					rook = Piece.find_by(current_position_x: 0, current_position_y: 7)
				elsif destination_x == 6
					rook = Piece.find_by(current_position_x: 7, current_position_y: 7)
				end
		  elsif self.piece_color == "white"
				if destination_x == 2
					rook = Piece.find_by(current_position_x: 0, current_position_y: 0)
				elsif destination_x == 6
					rook = Piece.find_by(current_position_x: 7, current_position_y: 0)
				end
		  end	
		  if rook
				return !rook.has_moved?
			else
				return false
			end
    end
  end

  def pieces_between?(destination_y)   
  end

end

