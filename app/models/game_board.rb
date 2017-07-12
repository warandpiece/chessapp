class GameBoard
  attr_accessor :board

  def initialize
    rank = ('a'..'h').to_a
    file = (1..8).to_a.reverse
    @board = []

    file.each do |f|
      rank.each do |r|
        @board << r + f.to_s
      end
    end
  end

  def self.make_board
    make_rook
    # make_bishop
    # etc
  end

  def make_rook
    [{ x: 7, y: 0 }, { x: 7, y: 7 }].each do |position|
      Piece.create(piece_type: "Rook", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y])
    end

    [{ x: 0, y: 0 }, { x: 0, y: 7 }].each do |position|
      Piece.create(piece_type: "Rook", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y])
    end
  end


end


