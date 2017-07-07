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
end