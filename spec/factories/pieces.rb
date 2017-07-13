FactoryGirl.define do
  factory :piece do
    game
    user { FactoryGirl.create(:white_player) }
    starting_position_x 0
    starting_position_y 0 
    current_position_x 5
    current_position_y 5
  end
end