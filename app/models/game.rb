class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true

  GAME_STATUS = [:open, :in_progress, :white_wins, :black_wins, :draw, :stalemate, :white_check, :black_check]

  has_many :pieces
  has_many :moves
  has_one :game_board

  scope :available, -> { where(game_status: :open) }

  after_create :set_game_board

  validates :white_player, presence: true, allow_blank: true
  validates :black_player, presence: true, allow_blank: true
  validates :game_status, presence: true

  def turn_change
    self.turn == "white" ? self.turn = "black" : self.turn = "white"
  end

  def opposite_color
    self.turn == "white" ? "black" : "white"
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

  def check
    king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: self.turn)
    opposite_color = self.opposite_color

    Piece.where(game_id: self.id, piece_color: opposite_color).each do |piece|
        return true if piece.valid_move?(king.current_x, king.current_y)
    end
    false
  end

  def move_out_of_check?
    king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: self.turn)
    starting_x = king.current_x
    starting_y = king.current_y
    state = false
    ((king.current_x - 1)..(king.current_x + 1)).each do |x|
      ((king.current_y - 1)..(king.current_y + 1)).each do |y|
        king.update(current_x: x, current_y: y) if king.valid_move?(x,y)
        state = true unless check
        king.update(current_x: starting_x, current_y: starting_y)
      end
    end
    state
  end

  def checkmate?
    return false unless check
    return false if move_out_of_check?
  end

  private
  
  def set_game_board
    GameBoard.make_board(self)
  end
end 