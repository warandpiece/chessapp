class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true

  has_many :pieces
  has_many :moves
  has_one :game_board

  after_create :set_game_board

  validates :game_status, presence: true

  private
  def set_game_board
    GameBoard.make_board(self)
  end
end

