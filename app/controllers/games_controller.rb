class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @game = Game.all
    # or Game.available?
  end

  def show
    @game = current_user.games.find_by(id: params[:id])
  end

  def new
    @game = Game.new
    @pieces = [
      { type: "pawn", color: "white", x: 0, y: 1 },
      { type: "queen", color: "white", x: 3, y: 0 },
      { type: "pawn", color: "black", x: 6, y: 6 }
    ]
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created
      #redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def update
    @game = Game.find_by(id: params[:id])

    if @game
      @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id, :game_status)
  end
end
