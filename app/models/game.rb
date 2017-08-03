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

  def check
    king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: self.turn)
    opposite_color = self.opposite_color

    Piece.where(game_id: self.id, piece_color: opposite_color).each do |piece|
        return true if piece.valid_move?(king.current_x, king.current_y)
    end
    false
  end

  private
  def set_game_board
    GameBoard.make_board(self)
  end
end 
