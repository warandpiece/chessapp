class Game < ApplicationRecord
  belongs_to :user, foreign_key: 'white_player'
  has_many :pieces
  has_many :moves

  validates :white_player, presence: true
  validates :black_player, presence: true
  validates :game_status, presence: true
end