module ApplicationHelper

# needs to be moved to games_helper.rb, file missing?
  def piece_at_location?(pieces, row, col)
    pieces.each do |piece|
      return [piece[:color], piece[:type]] if piece[:x]==col && piece[:y]==row
    end
    false
  end
end
