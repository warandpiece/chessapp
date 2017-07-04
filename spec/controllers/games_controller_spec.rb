require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  
  
  describe "games#new" do

    it "assigns a new game to @game" do
      get :new

      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "games#create" do
    it "" do

    end
  end

  describe "games#update" do
    it "" do

    end
  end
end


# class GamesController < ApplicationController
#   before_action :authenticate_user!

#   def new
#     @game = Game.new
#   end

#   def create
#     @game = Game.create(game_params)
#   end

#   def update
#     @game = Game.find_by_id(params[:id])
#     return render_not_found if @game.blank?
#     return render_not_found(:forbidden) if @game.user != current_user
#     @game.update_attributes(game_params)
#   end

#   private

#   def game_params
#     params.require(:game).permit(:white_player, :black_player, :game_status_id)
#   end
# end