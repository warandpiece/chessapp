FactoryGirl.define do
  factory :bishop do
    game
    user { FactoryGirl.create(:white_player) }
  end
end