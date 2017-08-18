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
    @piece = Piece.find_by(id: params[:id])
    row = params[:row].to_i
    column = params[:column].to_i
      if @piece_color != @piece.game.turn
        render text: "It is the other player's turn"
      elsif @piece.move_piece(row, column == false)
        render text: "Invalid Move"
      else
        render text: "Valid Move"
      end          
  end

  private

  def piece_params
    params.require(:piece).permit(:piece_type, :piece_color, :current_x, :current_y)
  end
end