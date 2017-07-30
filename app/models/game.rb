class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true

  has_many :pieces
  has_many :moves
  has_one :game_board

  scope :available, -> {where('black_player_id is NULL').or(where('white_player_id is NULL'))}

  after_create :set_game_board

  validates :white_player, presence: true, allow_blank: true
  validates :black_player, presence: true, allow_blank: true
  validates :game_status, presence: true

  def turn_change
    self.turn == "white" ? self.turn = "black" : self.turn = "white"
  end

  def check
    white_king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: "white")
    black_king = Piece.find_by(game_id: self.id, piece_type: "King", piece_color: "black")

    Piece.where(game_id: self.id).each do |piece|
      if piece.piece_color == "white"
        return :black_player, true if piece.valid_move?(black_king.current_position_x, 
                                                        black_king.current_position_y)
      elsif piece.piece_color == "black"
        return :white_player, true if piece.valid_move?(white_king.current_position_x, 
                                                        white_king.current_position_y)
      end
    end
    return false
  end

  private
  def set_game_board
    GameBoard.make_board(self)
  end
end 