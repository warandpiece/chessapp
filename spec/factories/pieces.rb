FactoryGirl.define do
  factory :piece do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :rook do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :knight do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :bishop do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :king do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :queen do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :pawn do
    game { FactoryGirl.create(:game, :no_pieces) }
    user { FactoryGirl.create(:white_player) }
  end
end
