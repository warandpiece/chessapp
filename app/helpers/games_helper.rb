module GamesHelper
  def piece_at_location?(pieces, row, col)
    pieces.each do |piece|
      if piece[:current_position_x]==col && piece[:current_position_y]==row
        return [piece[:color], piece[:type]]
      end
    end
    false
  end
end