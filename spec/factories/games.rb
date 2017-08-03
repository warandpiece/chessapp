FactoryGirl.define do
  factory :game do
    trait :full do
      white_player { FactoryGirl.create(:white_player) }
      black_player { FactoryGirl.create(:black_player) }
      game_status :in_progress
    end

    trait :no_wh do
      black_player { FactoryGirl.create(:black_player) }
      game_status :open
    end

    trait :no_bl do
      white_player { FactoryGirl.create(:white_player) }
      game_status :open
    end

    trait :no_players do
      game_status :open
    end

    trait :no_pieces do
      white_player { FactoryGirl.create(:white_player) }
      black_player { FactoryGirl.create(:black_player) }
      turn "white"
      after(:create) {|instance| instance.pieces.destroy_all}
    end
  end
end
