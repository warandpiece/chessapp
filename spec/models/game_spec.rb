require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#set_game_board" do
    it "should increate piece count by 32" do
      game = FactoryGirl.create(:game)

      game.send(:set_game_board)

      expect(Piece.where(game_id: game.id).count).to eq(32)
    end
  end
end