FactoryGirl.define do  

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
    first_name "John"
    sequence :username do |n|
      "chessmaster#{n}"
    end
  end

  factory :game do
    white_player  
    black_player
    game_status_id
  end
end
