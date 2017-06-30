require 'rails_helper'

RSpec.describe User, type: :model do
  it "FactoryGirl to create valid user" do 
    user = FactoryGirl.create(:user)

    expect(user).to be_valid
    expect(user.first_name).to eq("John")
  end


end