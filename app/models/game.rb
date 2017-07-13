class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true

  has_many :pieces
  has_many :moves

  validates :white_player, presence: true, allow_blank: true
  validates :black_player, presence: true, allow_blank: true
  validates :game_status, presence: true

  scope :avail, -> {where('black_player_id is NULL').or(where('white_player_id is NULL'))}

  # def avail
  #   if white_player.present? == false
  #     return true
  #   elsif black_player.present? == false
  #     return true
  #   else
  #     return false
  #     end 
  # end
end