class PiecesController < ApplicationController
  before_action :authenticate_user!

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.create(piece_params)
  end

  def update
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
    return render_not_found(:forbidden) if @piece.user != current_user
    @piece.update_attributes(piece_params)
  end

  private

  def piece_params
    params.require(:piece).permit(:piece_type, :piece_color, :current_position_x, 
        :current_postition_y, :starting_position_x, :starting_position_y)
  end
end
