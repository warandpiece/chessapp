require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe '#new' do
    it 'assigns a new game to @game' do
      white_player = FactoryGirl.create(:white_player)
      sign_in white_player

      get :new

      expect(assigns(:game)).to be_a_new(Game)
    end

    it 'returns http status 200' do
      white_player = FactoryGirl.create(:white_player)
      sign_in white_player

      get :new

      expect(response).to have_http_status(200)
    end

    it 'renders new game template' do
      white_player = FactoryGirl.create(:white_player)
      sign_in white_player

      get :new

      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'should save to the database' do
        white_player = FactoryGirl.create(:white_player)
        black_player = FactoryGirl.create(:black_player)
        sign_in white_player

        expect do
          post :create, params: { game: { white_player_id: white_player,
                                          black_player_id: black_player, game_status: 'In play' } }
        end.to change(Game, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'should not save to database with invalid game_status' do
        white_player = FactoryGirl.create(:white_player)
        black_player = FactoryGirl.create(:black_player)
        sign_in white_player

        expect do
          post :create, params: { game: { white_player_id: white_player,
                                          black_player_id: black_player, game_status: '' } }
        end.to change { Game.count }.by(0)
      end

      it 'should not save to database with invalid white_player' do
        black_player = FactoryGirl.create(:black_player)
        sign_in black_player

        expect do
          post :create, params: { game: { white_player_id: nil,
                                          black_player_id: black_player, game_status: 'In Play' } }
        end.to change { Game.count }.by(0)
      end

      it 'should not save to database with invalid black_player' do
        white_player = FactoryGirl.create(:white_player)
        sign_in white_player

        expect do
          post :create, params: { game: { white_player_id: white_player,
                                          black_player_id: nil, game_status: 'In Play' } }
        end.to change { Game.count }.by(0)
      end
    end
  end

  describe '#show' do
    it 'something' do 
      white_player = FactoryGirl.create(:white_player)
      sign_in white_player
      game = FactoryGirl.create(:game, white_player: white_player)

      get :show, params: {id: game.id}

      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'should update the database' do
        white_player = FactoryGirl.create(:white_player)
        sign_in white_player
        game = FactoryGirl.create(:game, white_player: white_player)

        put :update, params: { id: game.to_param, game: { game_status: 'White in Check' } }

        game.reload
        expect(game.game_status).to eq('White in Check')
      end
    end
  end

  describe 'games#index action' do
    it 'should require users to be logged in' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully show the page if a user is logged in' do
      white_player = FactoryGirl.create(:white_player)
      sign_in white_player

      get :index
      expect(response).to have_http_status(:success)
    end

    it 'should list one game available to join' do
      game = FactoryGirl.create(:game, white_player: white_player)
      black_player = FactoryGirl.create(:black_player)
      sign_in black_player

      get :index
      expect(response).to eq(game.last)
    end

    it 'should list the games available to join' do
      game_1 = FactoryGirl.create(:game, white_player: white_player)
      game_2 = FactoryGirl.create(:game, white_player: white_player)
      black_player = FactoryGirl.create(:black_player)
      sign_in black_player

      get :index

      expect(response).to have_http_status(:success)
      expect(Game.count).to eq(2)
      game_ids = Game.collect do |game|
        game["id"]
      end
      expect(game_ids).to eq([game_1.id, game_2.id])
    end
  end
end
