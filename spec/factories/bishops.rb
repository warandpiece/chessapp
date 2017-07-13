FactoryGirl.define do
  factory :bishop do
    game { FactoryGirl.create(:game) }
    user { FactoryGirl.create(:white_player) }
  end
end
