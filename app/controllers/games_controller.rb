class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @game = Game.all
    # or Game.available?
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def new
    @game = Game.new
    @pieces = [
      { type: "pawn", color: "white", x: 0, y: 1 },
      { type: "pawn", color: "white", x: 1, y: 1 },
      { type: "pawn", color: "white", x: 2, y: 1 },
      { type: "pawn", color: "white", x: 3, y: 1 },
      { type: "pawn", color: "white", x: 4, y: 1 },
      { type: "pawn", color: "white", x: 5, y: 1 },
      { type: "pawn", color: "white", x: 6, y: 1 },
      { type: "pawn", color: "white", x: 7, y: 1 },
      { type: "rook", color: "white", x: 0, y: 0 },
      { type: "rook", color: "white", x: 7, y: 0 },
      { type: "knight", color: "white", x: 1, y: 0 },
      { type: "knight", color: "white", x: 6, y: 0 },
      { type: "bishop", color: "white", x: 2, y: 0 },
      { type: "bishop", color: "white", x: 5, y: 0 },
      { type: "king", color: "white", x: 4, y: 0 },
      { type: "queen", color: "white", x: 3, y: 0 },
      { type: "pawn", color: "black", x: 0, y: 6 },
      { type: "pawn", color: "black", x: 1, y: 6 },
      { type: "pawn", color: "black", x: 2, y: 6 },
      { type: "pawn", color: "black", x: 3, y: 6 },
      { type: "pawn", color: "black", x: 4, y: 6 },
      { type: "pawn", color: "black", x: 5, y: 6 },
      { type: "pawn", color: "black", x: 6, y: 6 },
      { type: "pawn", color: "black", x: 7, y: 6 },
      { type: "rook", color: "black", x: 7, y: 7 },
      { type: "rook", color: "black", x: 0, y: 7 },
      { type: "knight", color: "black", x: 1, y: 7 },
      { type: "knight", color: "black", x: 6, y: 7 },
      { type: "bishop", color: "black", x: 2, y: 7 },
      { type: "bishop", color: "black", x: 5, y: 7 },
      { type: "king", color: "black", x: 4, y: 7 },
      { type: "queen", color: "black", x: 3, y: 7 },
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
