require 'rails_helper'

RSpec.describe Knight, type: :model do
  it "Knight should inherit behavior from Piece" do 
    expect(Knight.superclass).to eq(Piece)
  end
end