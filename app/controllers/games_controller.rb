class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @game = Game.all
    # or Game.available?
  end

  def show
    @users_game = (current_user.game_id.nil?) ? Game.new : Game.find(current_user.game_id)
    @pieces = Piece.where(game_id:  @game.id)
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    #@game = Game.create(game_params)
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
