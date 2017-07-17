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

  def self.make_board(user_id, game_id)
    make_rook(user_id, game_id)
    make_knight(user_id, game_id)
    make_bishop(user_id, game_id)
    make_queen(user_id, game_id)
    make_king(user_id, game_id)
    make_pawn(user_id, game_id)
  end

  def self.make_rook(user_id, game_id)
    [{ x: 0, y: 0 }, { x: 7, y: 0 }].each do |position|
      Piece.create(piece_type: "Rook", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: user_id, game_id: game_id)
    end

    [{ x: 0, y: 7 }, { x: 7, y: 7 }].each do |position|
      Piece.create(piece_type: "Rook", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y],
        user_id: user_id, game_id: game_id)
    end
  end

  def self.make_knight(user_id, game_id)
    [{ x: 1, y: 0 }, { x: 6, y: 0 }].each do |position|
      Piece.create(piece_type: "Knight", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: user_id, game_id: game_id)
    end

    [{ x: 1, y: 7 }, { x: 6, y: 7 }].each do |position|
      Piece.create(piece_type: "Knight", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y],
        user_id: user_id, game_id: game_id)
    end
  end

  def self.make_bishop(user_id, game_id)
    [{ x: 2, y: 0 }, { x: 5, y: 0 }].each do |position|
      Piece.create(piece_type: "Bishop", piece_color: "white", 
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: user_id, game_id: game_id)
    end

    [{ x: 2, y: 7 }, { x: 5, y: 7 }].each do |position|
      Piece.create(piece_type: "Bishop", piece_color: "black", 
        current_position_x: position[:x], current_position_y: position[:y],
        user_id: user_id, game_id: game_id)
    end
  end

  def self.make_queen(user_id, game_id)
    Piece.create(piece_type: "Queen", piece_color: "white", 
      current_position_x: 3, current_position_y: 0, 
      user_id: user_id, game_id: game_id)

    Piece.create(piece_type: "Queen", piece_color: "black", 
      current_position_x: 3, current_position_y: 7,
      user_id: user_id, game_id: game_id)
  end

  def self.make_king(user_id, game_id)
    Piece.create(piece_type: "King", piece_color: "white", 
      current_position_x: 4, current_position_y: 0, 
      user_id: user_id, game_id: game_id)

    Piece.create(piece_type: "King", piece_color: "black", 
      current_position_x: 4, current_position_y: 7,
      user_id: user_id, game_id: game_id)
  end

  def self.make_pawn(user_id, game_id)

    (0..7).each do |x|
      Piece.create(piece_type: "Pawn", piece_color: "white", 
        current_position_x: x, current_position_y: 1, 
        user_id: user_id, game_id: game_id)
    end

    (0..7).each do |x|
      Piece.create(piece_type: "Pawn", piece_color: "black", 
        current_position_x: x, current_position_y: 6, 
        user_id: user_id, game_id: game_id)
    end
  end
end


