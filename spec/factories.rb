FactoryGirl.define do  

  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password "secretPassword"
    password_confirmation "secretPassword"
    first_name "John"
    sequence(:username) { |n| "chessmaster#{n}" }
  end

  factory :game do
    white_player Factory(:user)
    black_player Factory(:user)
    game_status_id "In play"
  end
end