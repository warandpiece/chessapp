require 'rails_helper'

RSpec.describe Game, type: :model do
  describe Game, "scope" do
    it "Show games with white and black player present as closed" do
      game = FactoryGirl.create(:game, :full) 
      expect(Game.avail.map(&:id)[0]).to eq(nil)      
    end

    it "Shows games with white player present but no black player as open" do
      game = FactoryGirl.create(:game, :no_bl)
      expect(Game.avail.map(&:id)[0]).to eq(game.id)
    end

    it "Shows games with white player not present but back player present as open" do
      game = FactoryGirl.create(:game, :no_wh)
      expect(Game.avail.map(&:id)[0]).to eq(game.id)
    end

    it "Shows games with no white or black player present as open" do
      game = FactoryGirl.create(:game, :no_players)
      expect(Game.avail.map(&:id)[0]).to eq(game.id)  
    end
  end
end