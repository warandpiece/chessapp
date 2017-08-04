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

  def self.make_board(game)
    make_piece(game, "white", [{ x: 0, y: 0 }, { x: 7, y: 0 }], game.white_player_id, "Rook")
    make_piece(game, "black", [{ x: 0, y: 7 }, { x: 7, y: 7 }], game.black_player_id, "Rook")
    make_piece(game, "white", [{ x: 1, y: 0 }, { x: 6, y: 0 }], game.white_player_id, "Knight")
    make_piece(game, "black", [{ x: 1, y: 7 }, { x: 6, y: 7 }], game.black_player_id, "Knight")
    make_piece(game, "white", [{ x: 2, y: 0 }, { x: 5, y: 0 }], game.white_player_id, "Bishop")
    make_piece(game, "black", [{ x: 2, y: 7 }, { x: 5, y: 7 }], game.black_player_id, "Bishop")
    make_piece(game, "white", [{ x: 3, y: 0 }], game.white_player_id, "Queen")
    make_piece(game, "black", [{ x: 3, y: 7 }], game.black_player_id, "Queen")
    make_piece(game, "white", [{ x: 4, y: 0 }], game.white_player_id, "King")
    make_piece(game, "black", [{ x: 4, y: 7 }], game.black_player_id, "King")
    make_piece(game, "white", [{ x: 0, y: 1 }, { x: 1, y: 1 }, { x: 2, y: 1 }, { x: 3, y: 1 }, { x: 4, y: 1 }, { x: 5, y: 1 }, { x: 6, y: 1 }, { x: 7, y: 1 }], game.white_player_id, "Pawn")
    make_piece(game, "black", [{ x: 0, y: 6 }, { x: 1, y: 6 }, { x: 2, y: 6 }, { x: 3, y: 6 }, { x: 4, y: 6 }, { x: 5, y: 6 }, { x: 6, y: 6 }, { x: 7, y: 6 }], game.black_player_id, "Pawn")
  end

  def self.make_piece(game, color, positions, player_id, piece_type)
    positions.each do |position|
      Piece.create(piece_type: piece_type, piece_color: color,
        current_position_x: position[:x], current_position_y: position[:y], 
        user_id: player_id, game_id: game.id)
    end
  end

  # def self.make_rook(game)
  #   [{ x: 0, y: 0 }, { x: 7, y: 0 }].each do |position|
  #     Piece.create(piece_type: "Rook", piece_color: "white", 
  #       current_position_x: position[:x], current_position_y: position[:y], 
  #       user_id: game.white_player_id, game_id: game.id)
  #   end

  #   [{ x: 0, y: 7 }, { x: 7, y: 7 }].each do |position|
  #     Piece.create(piece_type: "Rook", piece_color: "black", 
  #       current_position_x: position[:x], current_position_y: position[:y],
  #       user_id: game.black_player_id, game_id: game.id)
  #   end
  # end

  # def self.make_knight(game)
  #   [{ x: 1, y: 0 }, { x: 6, y: 0 }].each do |position|
  #     Piece.create(piece_type: "Knight", piece_color: "white", 
  #       current_position_x: position[:x], current_position_y: position[:y], 
  #       user_id: game.white_player_id, game_id: game.id)
  #   end

  #   [{ x: 1, y: 7 }, { x: 6, y: 7 }].each do |position|
  #     Piece.create(piece_type: "Knight", piece_color: "black", 
  #       current_position_x: position[:x], current_position_y: position[:y],
  #       user_id: game.black_player_id, game_id: game.id)
  #   end
  # end

  # def self.make_bishop(game)
  #   [{ x: 2, y: 0 }, { x: 5, y: 0 }].each do |position|
  #     Piece.create(piece_type: "Bishop", piece_color: "white", 
  #       current_position_x: position[:x], current_position_y: position[:y], 
  #       user_id: game.white_player_id, game_id: game.id)
  #   end

  #   [{ x: 2, y: 7 }, { x: 5, y: 7 }].each do |position|
  #     Piece.create(piece_type: "Bishop", piece_color: "black", 
  #       current_position_x: position[:x], current_position_y: position[:y],
  #       user_id: game.black_player_id, game_id: game.id)
  #   end
  # end

  # def self.make_queen(game)
  #   Piece.create(piece_type: "Queen", piece_color: "white", 
  #     current_position_x: 3, current_position_y: 0, 
  #     user_id: game.white_player_id, game_id: game.id)

  #   Piece.create(piece_type: "Queen", piece_color: "black", 
  #     current_position_x: 3, current_position_y: 7,
  #     user_id: game.black_player_id, game_id: game.id)
  # end

  # def self.make_king(game)
  #   Piece.create(piece_type: "King", piece_color: "white", 
  #     current_position_x: 4, current_position_y: 0, 
  #     user_id: game.white_player_id, game_id: game.id)

  #   Piece.create(piece_type: "King", piece_color: "black", 
  #     current_position_x: 4, current_position_y: 7,
  #     user_id: game.black_player_id, game_id: game.id)
  # end

  # def self.make_pawn(game)
  #   (0..7).each do |x|
  #     Piece.create(piece_type: "Pawn", piece_color: "white", 
  #       current_position_x: x, current_position_y: 1, 
  #       user_id: game.white_player_id, game_id: game.id)
  #   end

  #   (0..7).each do |x|
  #     Piece.create(piece_type: "Pawn", piece_color: "black", 
  #       current_position_x: x, current_position_y: 6, 
  #       user_id: game.black_player_id, game_id: game.id)
  #   end
  # end
end
