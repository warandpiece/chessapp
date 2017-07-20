class PiecesController < ApplicationController
  before_action :authenticate_user!

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)
    if @piece.save
      render :show, status: :created
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def update
    @piece = current_user.games.pieces.find_by(id: params[:id])
    return render_not_found if @piece.blank?
    @piece.update_attributes(piece_params)
  end

  private

  def piece_params
    params.require(:piece).permit(:piece_type, :piece_color, :current_position_x, 
        :current_position_y, :starting_position_x, :starting_position_y)
  end
end