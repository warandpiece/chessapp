require 'rails_helper'

RSpec.describe Game, type: :model do
  descripe Game, ".avail_scope" do
    it "Show games with white and black player present as closed" do
      # user1 = FactoryGirl.create(:white_player)
      # user2 = FactoryGirl.create(:black_player) 
      # post :create, { params: { white_player: user1.id, black_player: user2.id, game_status: "In play"}}
      # FactoryGirl.create(:game)
      game = FactoryGirl.create(:game) 
     

      expect(Game.last.avail_scope).to eq(false)
      # game = FactoryGirl.create(:game)
      

    end
  end
end