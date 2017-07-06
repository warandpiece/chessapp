require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "#new" do
    it "assigns a new game to @game" do
      user1 = FactoryGirl.create(:user)
      sign_in user1

      get :new

      expect(assigns(:game)).to be_a_new(Game)
    end

    it "returns http status 200" do
      user1 = FactoryGirl.create(:user)
      sign_in user1

      get :new

      expect(response).to have_http_status(200)
    end

    it "renders new game template" do
      user1 = FactoryGirl.create(:user)
      sign_in user1

      get :new

      expect(response).to render_template :new
    end
  end

  describe "#create" do
    context "with valid params" do
      it "should save to the database" do
        user1 = FactoryGirl.create(:user)
        user2 = FactoryGirl.create(:user)
        sign_in user1

                expect {
        post :create, { params: { game: { white_player: user1.id, 
             black_player: user2.id, game_status: "In play" } } }
          }.to change{Game.count}.by(1)
        game = Game.last
        expect(game.black_player).to eq(user2.id)
      end
    end

    context "with invalid params" do
      it "should not save to database with invalid game_status" do
        user1 = FactoryGirl.create(:user)
        user2 = FactoryGirl.create(:user)
        sign_in user1

        expect {
          post :create, { params: { game: { white_player: user1.id, 
               black_player: user2.id, game_status: "" } } }
          }.to change{Game.count}.by(0)
      end

      it "should not save to database with invalid white_player" do
        user2 = FactoryGirl.create(:user)

        expect {
          post :create, { params: { game: { white_player: nil, 
               black_player: user2.id, game_status: "In Play" } } }
          }.to change{Game.count}.by(0)
      end

      it "should not save to database with invalid black_player" do
        user1 = FactoryGirl.create(:user)
        sign_in user1

        expect {
          post :create, { params: { game: { white_player: user1.id, 
               black_player: nil, game_status: "In Play" } } }
          }.to change{Game.count}.by(0)
      end
    end
  end

  describe "#update" do
    context "with valid params" do
      it "should update the database" do
        user1 = FactoryGirl.create(:user)
        user2 = FactoryGirl.create(:user)
        sign_in user1
        game = FactoryGirl.create(:game, white_player: user1.id, black_player: user2.id)
        

        #put :update, { params: { game: { game_status: "White in Check" } } }
        put :update, params: {id: game.id, game: { game_status: 'White in Check' } }      
        expect(game.game_status).to eq("White in Check")
      end
    end


    context "with invalid params" do
      it "" do
      end
    end
  end
end