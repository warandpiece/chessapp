class Piece < ApplicationRecord
  belong_to :user
  belong_to :game
end
