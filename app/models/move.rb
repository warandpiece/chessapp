class Move < ApplicationRecord
  belongs_to :piece
  belongs_to :game
end