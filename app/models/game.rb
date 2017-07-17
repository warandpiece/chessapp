class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  after_create :GameBoard.make_board

  has_many :pieces
  has_many :moves

  validates :white_player, presence: true
  validates :black_player, presence: true
  validates :game_status, presence: true
end
