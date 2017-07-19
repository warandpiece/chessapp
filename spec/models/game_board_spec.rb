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

  describe '#make_rook' do
    it 'should add rooks to the correct positions' do
      game = FactoryGirl.create(:game)
      rook_positions = [{ x: 0, y: 0 }, { x: 7, y: 0 }, { x: 0, y: 7 }, { x: 7, y: 7 }]

      GameBoard.make_rook(game)

      rook_positions.each do |position|
        expect(Rook.exists?(current_position_x: position[:x],
                            current_position_y: position[:y])).to eq(true)
      end
    end
  end

  describe '#make_knight' do
    it 'should add knights to the correct positions' do
      game = FactoryGirl.create(:game)
      knight_positions = [{ x: 1, y: 0 }, { x: 6, y: 0 }, { x: 1, y: 7 }, { x: 6, y: 7 }]

      GameBoard.make_knight(game)

      knight_positions.each do |position|
        expect(Knight.exists?(current_position_x: position[:x],
                              current_position_y: position[:y])).to eq(true)
      end
    end
  end

  describe '#make_bishop' do
    it 'should add bishops to the correct positions' do
      game = FactoryGirl.create(:game)
      bishop_positions = [{ x: 2, y: 0 }, { x: 5, y: 0 }, { x: 2, y: 7 }, { x: 2, y: 7 }]

      GameBoard.make_bishop(game)

      bishop_positions.each do |position|
        expect(Bishop.exists?(current_position_x: position[:x],
                              current_position_y: position[:y])).to eq(true)
      end
    end
  end

  describe '#make_queen' do
    it 'should add queens to the correct positions' do 
      game = FactoryGirl.create(:game)
      queen_positions = [{ x: 3, y: 0 }, { x: 3, y: 7 }]

      GameBoard.make_queen(game)

      queen_positions.each do |position|
        expect(Queen.exists?(current_position_x: position[:x],
                             current_position_y: position[:y])).to eq(true)
      end
    end
  end

  describe '#make_king' do
    it 'should add kings to the correct positions' do
      game = FactoryGirl.create(:game)
      king_positions = [{ x: 4, y: 0 }, { x: 4, y: 7 }]

      GameBoard.make_king(game)

      king_positions.each do |position|
        expect(King.exists?(current_position_x: position[:x],
                            current_position_y: position[:y])).to eq(true)
      end
    end
  end

  describe '#make_pawn' do
    it 'should add pawns to the correct positions' do
      game = FactoryGirl.create(:game)
      pawn_positions = [{ x: 0, y: 1}, { x: 1, y: 1}, { x: 2, y: 1}, 
                        { x: 3, y: 1}, { x: 4, y: 1}, { x: 5, y: 1}, 
                        { x: 6, y: 1}, { x: 7, y: 1}, { x: 0, y: 6}, 
                        { x: 1, y: 6}, { x: 2, y: 6}, { x: 3, y: 6}, 
                        { x: 4, y: 6}, { x: 5, y: 6}, { x: 6, y: 6}, 
                        { x: 7, y: 6}]
                        
      GameBoard.make_pawn(game)

      pawn_positions.each do |position|
        expect(Pawn.exists?(current_position_x: position[:x],
                            current_position_y: position[:y])).to eq(true)
      end
    end
  end
end