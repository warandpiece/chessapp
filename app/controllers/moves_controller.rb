class MovesController < ApplicationController
  before_action :authenticate_user!

  def new
    @move = Move.new
  end

  def create
    @move = Move.create(move_params)
  end

  def update
    @move = current_user.games.moves.find_by_id(params[:id])
    return render_not_found if @move.blank?
    return render_not_found(:forbidden) if @move.user != current_user
    @move.update_attributes(move_params)
  end

  private

  def move_params
    params.require(:move).permit(:move_count, :moves_taken)
  end
end
