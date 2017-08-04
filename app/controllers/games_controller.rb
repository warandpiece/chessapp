class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.available
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.white_player_id = current_user.id
    @game.black_player_id = nil
    @game.game_status = :open
    if @game.save
      redirect_to @game
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    @game = Game.create(white_player_id: current_user.id, black_player_id: nil) if @game.nil?
    @pieces = Piece.where(game_id: @game.id)
  end

  def update
    @game = Game.find_by(id: params[:id])

    if @game
      @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      @game[:black_player_id] = current_user.id
      redirect_to @game
      
    # else
    #   render :edit
    end


  end

  def join
    @game = Game.find_by(id: params[:id])
    if @game
      @game = Game.black_player_id = current_user.id
    end
    
  end

  private

  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id, :game_status, :name)
  end
end
