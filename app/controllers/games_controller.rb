class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])
    @game = Game.create(white_player_id: current_user.id, black_player_id: current_user.id) if @game.nil?
    @pieces = Piece.where(game_id: @game.id)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.white_player_id = current_user.id
    @game.black_player_id = current_user.id

    if @game.save
      redirect_to @game, status: :created, notice: 'Game was successfully created.'
    else
      puts "Try again"
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
    params.require(:game).permit(:white_player_id, :black_player_id, :game_status, :name)
  end
end
