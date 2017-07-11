module MakeGame
  def define_board
    rank = ('a'..'h').to_a
    file = (1..8).to_a.reverse
    board = []

    file.each do |f|
      rank.each do |r|
        board << r + f.to_s
      end
    end
    return board
  end

  def make_rooks
    # makes 4 rooks, 2 white and 2 black
  end

  # make_bishops etc.



  def make_game
    #make_rooks
    #make_bishops
    #etc
  end
end