class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :moves

  self.inheritance_column = :piece_type

  scope :kings,   -> { where(piece_type: 'King') }
  scope :queens,  -> { where(piece_type: 'Queen') }
  scope :rooks,   -> { where(piece_type: 'Rook') }
  scope :bishops, -> { where(piece_type: 'Bishop') }
  scope :knights, -> { where(piece_type: 'Knight') }
  scope :pawns,   -> { where(piece_type: 'Pawn') }

  def is_position_occupied(x,y)
    piece = Piece.find_by current_position_x: x
    return true if piece != nil 
  end

#Piece.find_by_game_id(current_piece.game_id).filter{|p| p.current_position_x == current_piece.current_position_x

  #def is_obstructed(destination_x, destination_y)
   # Piece.where(destinatio
    #Piece.all
  #end

end