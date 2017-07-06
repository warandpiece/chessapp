FactoryGirl.define do  
  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password "secretPassword"
    password_confirmation "secretPassword"
    first_name "John"
    sequence(:username) { |n| "chessmaster#{n}" }
  end
end