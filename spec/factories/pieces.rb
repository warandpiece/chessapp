FactoryGirl.define do
  factory :piece do
    game { FactoryGirl.create(:game, :no_bl) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :rook do
    game { FactoryGirl.create(:game, :no_bl) }
    user { FactoryGirl.create(:white_player) }
  end

  factory :bishop do
    game { FactoryGirl.create(:game, :no_bl) }
    user { FactoryGirl.create(:white_player) }
  end
end
