class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true

  GAME_STATUS = [:open, :in_progress, :white_wins, :black_wins, :draw, :stalemate, :white_check, :black_check]

  has_many :pieces
  has_many :moves
  has_one :game_board

  scope :available, -> { where(game_status: :open) }

  after_create :make_pieces_for_white_player

  validates :white_player, presence: true, allow_blank: true
  validates :black_player, presence: true, allow_blank: true
  validates :game_status, presence: true

  def create_pieces_for_player(player_id, color)
  end

  def turn_change
    self.turn == "white" ? self.turn = "black" : self.turn = "white"
  end

  def stalemate?
    return false if check

    king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: self.turn)
    king_x = king.current_x
    king_y = king.current_y
    (-1..1).each do |x|
      (-1..1).each  do |y|
        test_x = king_x + x
        test_y = king_y + y
        if king.valid_move?(test_x,test_y)
          return false unless enemy_can_attack?(test_x,test_y)
        end
      end
    end
    true
  end

  def enemy_can_attack?(x,y)
    Piece.where(game_id: self.id, piece_color: opposite_color).each do |piece|
      return true if piece.valid_move?(x, y)
    end
    false
  end

  def opposite_color
    self.turn == "white" ? "black" : "white"
  end

  def check
    king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: self.turn)
    opposite_color = self.opposite_color
    Piece.where(game_id: self.id, piece_color: opposite_color).each do |piece|
      if piece.current_x
        return true if piece.valid_move?(king.current_x, king.current_y)
      end
    end
    false
  end

  def make_pieces_for_black_player
    make_piece("Rook", "black", [{ x: 0, y: 7 }, { x: 7, y: 7 }])
    make_piece("Knight", "black", [{ x: 1, y: 7 }, { x: 6, y: 7 }])
    make_piece("Bishop", "black", [{ x: 2, y: 7 }, { x: 5, y: 7 }])
    make_piece("Queen", "black", [{ x: 3, y: 7 }])
    make_piece("King", "black", [{ x: 4, y: 7 }])
    make_piece("Pawn", "black", [{ x: 0, y: 6 }, { x: 1, y: 6 }, { x: 2, y: 6 }, { x: 3, y: 6 }, { x: 4, y: 6 }, { x: 5, y: 6 }, { x: 6, y: 6 }, { x: 7, y: 6 }])
  end

  def make_pieces_for_white_player
    make_piece("Rook", "white", [{ x: 0, y: 0 }, { x: 7, y: 0 }])
    make_piece("Knight", "white", [])
    make_piece("Bishop", "white", [])
    make_piece("Queen", "white", [])
    make_piece("King", "white", [])
    make_piece("Pawn", "white", [])
  end

  private

  def set_game_board
    GameBoard.make_board(self)
  end

  def make_piece(piece_type, color, positions)
    player_id = color == "white" ? self.white_player_id : self.black_player_id
    positions.each do |position|
      Piece.create(piece_type: piece_type, piece_color: color,
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: player_id, game_id: self.id)
    end
  end

end 
