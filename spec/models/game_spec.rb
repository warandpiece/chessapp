require 'rails_helper'

RSpec.describe Game, type: :model do
  it ".set_game_board is called after game creation" do
    game = FactoryGirl.build(:game)

    expect(game).to receive(:set_game_board)
    game.save
  end
end