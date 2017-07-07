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

        puts white_player.id
        puts white_player.inspect
        
        post :create, params: { game: { white_player: white_player.id,
                                        black_player: black_player.id, 
                                        game_status: 'In play' } }

        expect(response).to change(Game, :count).by(1)

        # expect {
        # post :create, { params: { game: { white_player: white_player.id, 
        #      black_player: black_player.id, game_status: "In play" } } }
        #   }.to change{Game.count}.by(1)
        # expect do
        #   post :create, params: { game: { white_player: white_player.id,
        #                                   black_player: black_player.id, 
        #                                   game_status: 'In play' } }
        # end.to change(Game, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'should not save to database with invalid game_status' do
        white_player = FactoryGirl.create(:white_player)
        black_player = FactoryGirl.create(:black_player)
        sign_in white_player

        expect do
          post :create, params: { game: { white_player: white_player.id,
                                          black_player: black_player.id,
                                          game_status: '' } }
        end.to change { Game.count }.by(0)
      end

      it 'should not save to database with invalid white_player' do
        black_player = FactoryGirl.create(:black_player)

        expect do
          post :create, params: { game: { white_player: nil,
                                          black_player: black_player.id, 
                                          game_status: 'In Play' } }
        end.to change { Game.count }.by(0)
      end

      it 'should not save to database with invalid black_player' do
        white_player = FactoryGirl.create(:white_player)
        sign_in white_player

        expect do
          post :create, params: { game: { white_player: white_player.id,
                                          black_player: nil, 
                                          game_status: 'In Play' } }
        end.to change { Game.count }.by(0)
      end
    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'should update the database' do
        game = FactoryGirl.create(:game)
        sign_in game.white_player

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
end
