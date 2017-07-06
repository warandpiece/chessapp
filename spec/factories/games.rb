FactoryGirl.define do
  factory :game do
    white_player { create(:user) }
    black_player { create(:user) }
    game_status "In play"
  end
end