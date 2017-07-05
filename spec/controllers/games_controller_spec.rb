require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    sign_in @user1
  end
  
  describe "games#new" do
    it "assigns a new game to @game" do
      get :new

      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "games#create" do
    it "it should save to the database" do
      post :create, { params: { game: { white_player: @user1.id, 
           black_player: @user2.id, game_status_id: 3 } } }

      game = Game.find_by_white_player @user1.id
      expect(game.black_player).to eq(@user2.id)
    end
  end

  describe "games#update" do
    it "" do

    end
  end
end
