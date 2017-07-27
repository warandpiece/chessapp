require 'rails_helper'

RSpec.describe Game, type: :model do
  describe ".set_game_board" do
    it "should increate piece count by 32" do
      game = FactoryGirl.create(:game, :full)
      expect(Piece.where(game_id: game.id).count).to eq(32)
    end
  
    it ".set_game_board is called after game creation" do
      game = FactoryGirl.build(:game)
      expect(game).to receive(:set_game_board)
      game.save
    end
  end

  describe "initial turn" do
    it "should return white as the first turn" do
      game = FactoryGirl.build(:game)
      expect(game.turn).to eq("white")
    end
  end

  describe "change turns" do
    it "should change to black from white" do
      game = FactoryGirl.build(:game)
      game.turn_change
      expect(game.turn).to eq("black")
    end

    it "should change to black and back to white" do
      game = FactoryGirl.build(:game)
      game.turn_change
      expect(game.turn).to eq("black")
      game.turn_change
      expect(game.turn).to eq("white")
    end
  end

  describe Game, "scope" do
    it "Show games with white and black player present as closed" do
      game = FactoryGirl.create(:game, :full) 
      expect(Game.available.map(&:id)[0]).to eq(nil)      
    end

    it "Shows games with white player present but no black player as open" do
      game = FactoryGirl.create(:game, :no_bl)
      expect(Game.available.map(&:id)[0]).to eq(game.id)
    end

    it "Shows games with white player not present but back player present as open" do
      game = FactoryGirl.create(:game, :no_wh)
      expect(Game.available.map(&:id)[0]).to eq(game.id)
    end

    it "Shows games with no white or black player present as open" do
      game = FactoryGirl.create(:game, :no_players)
      expect(Game.available.map(&:id)[0]).to eq(game.id)  
    end
  end

  # CHECK METHOD

  describe "#check" do
    context "" do                                     
      it "white in check" do 
        game = FactoryGirl.create(:game, :no_pieces)
        king = Piece.create(piece_type: 'King', piece_color: 'white', game_id: game.id,
                                   current_position_x: 3, current_position_y: 0)
        rook = Piece.create(piece_type: 'Rook', piece_color: 'black', game_id: game.id,
                                   current_position_x: 0, current_position_y: 0)

      # game = FactoryGirl.create(:game, :full)
      # knight_positions = [{ x: 1, y: 0 }, { x: 6, y: 0 }, { x: 1, y: 7 }, { x: 6, y: 7 }]

      # GameBoard.make_knight(game)

      # knight_positions.each do |position|
      #   expect(Knight.exists?(current_position_x: position[:x],
      #                         current_position_y: position[:y])).to eq(true)
         

        expect(game.check).to eq(:white_player)
      end
    end
  end
end