class Rook < Piece
  attr_accessor :make_rooks
  def make_rooks
    # makes 4 rooks, 2 white and 2 black
    
    # params: { pieces: { :piece_type "Rook", :piece_color "white", :current_position_x 0, 
    #   :current_position_y 0, :starting_position_x 0, :starting_position_y 0 } }
    #   # a1, 7, 0 


    # { :piece_type "Rook", :piece_color "white", :current_position_x 0, 
    #   :current_position_y 0, :starting_position_x 0, :starting_position_y 0 }
    #   # h1, 7, 7

    # { :piece_type "Rook", :piece_color "black", :current_position_x 0, 
    #   :current_position_y 0, :starting_position_x 0, :starting_position_y 0 }
    #   # a8, 0, 0

    # { :piece_type "Rook", :piece_color "black", :current_position_x 0, 
    #   :current_position_y 0, :starting_position_x 0, :starting_position_y 0 }
    #   # h8, 0, 7

    # # params.require(:piece).permit(:piece_type, :piece_color, :current_position_x, 
    # #     :current_position_y, :starting_position_x, :starting_position_y)

  end
end