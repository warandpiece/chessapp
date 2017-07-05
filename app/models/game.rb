class Game < ApplicationRecord
  belongs_to :user, foreign_key: 'white_player'
  has_many :pieces
  has_many :moves
end