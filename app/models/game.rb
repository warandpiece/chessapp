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

  def check
    white_king_x = Piece.where(game_id: game.id, piece_type: "King", 
                               piece_color: "white").current_position_x
    white_king_y = Piece.where(game_id: game.id, piece_type: "King", 
                               piece_color: "white").current_position_y
    black_king_x = Piece.where(game_id: game.id, piece_type: "King", 
                               piece_color: "black").current_position_x
    black_king_y = Piece.where(game_id: game.id, piece_type: "King", 
                               piece_color: "black").current_position_y

    Piece.where(game_id: game.id).each do |piece|
      if piece.piece_color == "white"
        return :white_player if piece.valid_move?(black_king_x, black_king_y) == true
      elsif piece.piece_color == "black"
        return :black_player if piece.valid_move?(white_king_x, white_king_y) == true
      end
    end
    return false
  end

  private
  def set_game_board
    GameBoard.make_board(self)
  end
end 