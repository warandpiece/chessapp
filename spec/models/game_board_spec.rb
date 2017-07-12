require 'rails_helper'

RSpec.describe GameBoard, type: :model do

  describe "initialize" do
    it "should return an empty board" do
      board =  ["a8", "b8", "c8", "d8", "e8", "f8", "g8", "h8",
                "a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7",
                "a6", "b6", "c6", "d6", "e6", "f6", "g6", "h6",
                "a5", "b5", "c5", "d5", "e5", "f5", "g5", "h5",
                "a4", "b4", "c4", "d4", "e4", "f4", "g4", "h4",
                "a3", "b3", "c3", "d3", "e3", "f3", "g3", "h3",
                "a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2",
                "a1", "b1", "c1", "d1", "e1", "f1", "g1", "h1"]
      game_board = GameBoard.new

      result = game_board.board
      expect(result).to eq(board)
    end
  end

  # describe "#make_rook" do 
  #   it "should add rooks to the correct positions" do
  #     # User.create(email: "test@test.com", username: "chessguru", 
  #     #   password: "password3", password_confirmation: "password3")
  #     game = FactoryGirl.create(:game)

  #     GameBoard.make_rook(game.white_player_id, game.id)
  #     rook_positions = [{ x: 7, y: 0 }, { x: 7, y: 7 }, { x: 0, y: 0 }, { x: 0, y: 7 }]
  #     rooks = Piece.rooks.count
      
  #     expect(rooks).to eq(4)

  #     rooks.each do |r|
  #       expect(r.current_position_x).to eq(rook_positions[:x]) 
  #       expect(r.current_position_y).to eq(rook_positions[:y]) 
  #     end      
  #   end
  # end
end
