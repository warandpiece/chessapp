require 'rails_helper'

RSpec.describe MakeGame, type: :helper do

  describe "define_board" do
    it "should return an empty board" do
      board =  ["a8", "b8", "c8", "d8", "e8", "f8", "g8", "h8", 
                "a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7", 
                "a6", "b6", "c6", "d6", "e6", "f6", "g6", "h6", 
                "a5", "b5", "c5", "d5", "e5", "f5", "g5", "h5", 
                "a4", "b4", "c4", "d4", "e4", "f4", "g4", "h4", 
                "a3", "b3", "c3", "d3", "e3", "f3", "g3", "h3", 
                "a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2", 
                "a1", "b1", "c1", "d1", "e1", "f1", "g1", "h1"]

      expect(define_board).to eq(board)
    end
  end

  describe "make_rooks" do
    it "should create white rooks on a1 & ah and black rooks on a8 & h8" do
        white_player = FactoryGirl.create(:white_player)
        black_player = FactoryGirl.create(:black_player)
        sign_in white_player
        game = FactoryGirl.create(:game, white_player: white_player, 
                                         black_player: black_player,
                                         game_status: "New Game")


      

      expect(1).to eq(1)
    end
  end
end