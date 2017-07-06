class MovesController < ApplicationController
  before_action :authenticate_user!

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)

    if @move.save
      render :show, status: :created
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def update
    @move = current_user.games.moves.find_by(id: params[:id])
    return render_not_found if @move.blank?
    @move.update_attributes(move_params)
  end

  private

  def move_params
    params.require(:move).permit(:move_count, :moves_taken)
  end
end
