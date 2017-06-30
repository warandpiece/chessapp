class Game < ApplicationRecord
  belongs_to :user
  has_many :pieces
  has_many :moves
end