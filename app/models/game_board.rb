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
    make_knight
    make_bishop
    make_queen
    make_king
    make_pawn
  end

  def self.make_rook(user_id, game_id)
    [{ x: 7, y: 0 }, { x: 7, y: 7 }].each do |position|
      Piece.create(piece_type: "Rook", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: user_id, game_id: game_id)
    end

    [{ x: 0, y: 0 }, { x: 0, y: 7 }].each do |position|
      Piece.create(piece_type: "Rook", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y],
        user_id: user_id, game_id: game_id)
    end
  end

  def self.make_knight(user_id, game_id)
    [{ x: 7, y: 1 }, { x: 7, y: 6 }].each do |position|
      Piece.create(piece_type: "Knight", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: user_id, game_id: game_id)
    end

    [{ x: 0, y: 1 }, { x: 0, y: 6 }].each do |position|
      Piece.create(piece_type: "Knight", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y],
        user_id: user_id, game_id: game_id)
    end
  end

  def self.make_bishop(user_id, game_id)
    [{ x: 7, y: 2 }, { x: 7, y: 5 }].each do |position|
      Piece.create(piece_type: "Bishop", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: user_id, game_id: game_id)
    end

    [{ x: 0, y: 2 }, { x: 0, y: 5 }].each do |position|
      Piece.create(piece_type: "Bishop", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y],
        user_id: user_id, game_id: game_id)
    end
  end

  def self.make_queen(user_id, game_id)
    Piece.create(piece_type: "Queen", piece_color: "white", 
      current_position_x: 7, current_position_y: 3, 
      user_id: user_id, game_id: game_id)

    Piece.create(piece_type: "Queen", piece_color: "black", 
      current_position_x: 0, current_position_y: 3,
      user_id: user_id, game_id: game_id)
  end

    def self.make_king(user_id, game_id)
    Piece.create(piece_type: "King", piece_color: "white", 
      current_position_x: 7, current_position_y: 4, 
      user_id: user_id, game_id: game_id)

    Piece.create(piece_type: "King", piece_color: "black", 
      current_position_x: 0, current_position_y: 4,
      user_id: user_id, game_id: game_id)
  end

  def self.make_pawn(user_id, game_id)

    (0..7).each do |y|
      Piece.create(piece_type: "Pawn", piece_color: "white", 
        current_position_x: 6, current_position_y: y, 
        user_id: user_id, game_id: game_id)
    end

    (0..7).each do |y|
      Piece.create(piece_type: "Pawn", piece_color: "black", 
        current_position_x: 6, current_position_y: y, 
        user_id: user_id, game_id: game_id)
    end
  end
end


