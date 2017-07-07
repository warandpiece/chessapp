require 'rails_helper'

RSpec.describe Game, type: :model do
  it "Show games with white and black player present as closed" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user) 
    # post :create, { params: { white_player: user1.id, black_player: user2.id, game_status: "In play"}}
    game = FactoryGirl.create(:game, white_player: user1.id, black_player: user2.id, game_status: "In play")
    expect(game.avail).to eq(false)
    # game = FactoryGirl.create(:game)
    

  end
end