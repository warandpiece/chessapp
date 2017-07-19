require 'rails_helper'

RSpec.describe Game, type: :model do
  describe ".set_game_board" do
    it "should increate piece count by 32" do
      game = FactoryGirl.create(:game)

      expect(Piece.where(game_id: game.id).count).to eq(32)
    end
  
    it ".set_game_board is called after game creation" do
      game = FactoryGirl.build(:game)

      expect(game).to receive(:set_game_board)
      game.save
    end
  end
end