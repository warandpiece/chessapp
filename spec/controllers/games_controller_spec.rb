require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  # index or new?
  # describe 'games#index' do
  #   it 'should successfully show the page' do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

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

    context 'with invalid params' do
      it '' do
      end
    end
  end

  # def game_created
  #   user or player_id = FactoryGirl.create(:user)
  #   Game.create(white_user: player_id)
  # end

  # no player_id in create_games migration
  # default player white or black?
  # or create within #new, #show or #create?

end
