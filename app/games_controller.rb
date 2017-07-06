class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def show

  end

  def update
    @game = current_user.games.find_by_id(params[:id])
    return render_not_found if @game.blank?
    return render_not_found(:forbidden) if @game.user != current_user
    @game.update_attributes(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:white_player, :black_player, :game_status)
  end
end