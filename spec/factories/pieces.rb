FactoryGirl.define do
  factory :piece do
    game
    user { FactoryGirl.create(:white_player) }
  end
end
