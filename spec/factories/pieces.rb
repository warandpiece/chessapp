FactoryGirl.define do
  factory :piece do
    game
    user { FactoryGirl.create(:white_player) }
  end

  factory :rook do
    game
    user { FactoryGirl.create(:white_player) }
  end

  factory :bishop do
    game
    user { FactoryGirl.create(:white_player) }
  end
end
