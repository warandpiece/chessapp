class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true

  has_many :pieces
  has_many :moves

  validates :white_player, presence: true, allow_blank: true
  validates :black_player, presence: true, allow_blank: true
  validates :game_status, presence: true

  scope :avail, -> {where('black_player_id is NULL').or(where('white_player_id is NULL'))}

  def black_pieces
    return [
      { type: "pawn", color: "black", x: 0, y: 6 },
      { type: "pawn", color: "black", x: 1, y: 6 },
      { type: "pawn", color: "black", x: 2, y: 6 },
      { type: "pawn", color: "black", x: 3, y: 6 },
      { type: "pawn", color: "black", x: 4, y: 6 },
      { type: "pawn", color: "black", x: 5, y: 6 },
      { type: "pawn", color: "black", x: 6, y: 6 },
      { type: "pawn", color: "black", x: 7, y: 6 },
      { type: "rook", color: "black", x: 7, y: 7 },
      { type: "rook", color: "black", x: 0, y: 7 },
      { type: "knight", color: "black", x: 1, y: 7 },
      { type: "knight", color: "black", x: 6, y: 7 },
      { type: "bishop", color: "black", x: 2, y: 7 },
      { type: "bishop", color: "black", x: 5, y: 7 },
      { type: "king", color: "black", x: 4, y: 7 },
      { type: "queen", color: "black", x: 3, y: 7 }
    ]
  end

  def white_pieces
    return [
      { type: "pawn", color: "white", x: 0, y: 1 },
      { type: "pawn", color: "white", x: 1, y: 1 },
      { type: "pawn", color: "white", x: 2, y: 1 },
      { type: "pawn", color: "white", x: 3, y: 1 },
      { type: "pawn", color: "white", x: 4, y: 1 },
      { type: "pawn", color: "white", x: 5, y: 1 },
      { type: "pawn", color: "white", x: 6, y: 1 },
      { type: "pawn", color: "white", x: 7, y: 1 },
      { type: "rook", color: "white", x: 0, y: 0 },
      { type: "rook", color: "white", x: 7, y: 0 },
      { type: "knight", color: "white", x: 1, y: 0 },
      { type: "knight", color: "white", x: 6, y: 0 },
      { type: "bishop", color: "white", x: 2, y: 0 },
      { type: "bishop", color: "white", x: 5, y: 0 },
      { type: "king", color: "white", x: 4, y: 0 },
      { type: "queen", color: "white", x: 3, y: 0 }
    ]
  end

  def all_pieces
    white_pieces + black_pieces
  end

end

