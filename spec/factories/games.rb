FactoryGirl.define do
  factory :game do
    white_player { FactoryGirl.create(:white_player) }
    black_player { FactoryGirl.create(:black_player) }
    game_status "In play"
  end
end