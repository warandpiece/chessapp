require 'pry'
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
    piece = Piece.find_by(current_position_x: x, current_position_y: y)
    piece != nil
  end

  def is_bishop_move_blocked(destination_x, destination_y)
    bishop = Bishop.find_by(piece_type: 'Bishop')
    destination_x > bishop.current_position_x ? dir_x = 1 : dir_x = -1
    destination_y > bishop.current_position_y ? dir_y = 1 : dir_y = -1
    (1..(destination_x - bishop.current_position_x).abs).each do |i|
      x = bishop.current_position_x + i * dir_x
      y = bishop.current_position_y + i * dir_y
      piece = Piece.find_by(current_position_x: x, current_position_y: y)
      return true if piece
    end
    false
  end

end