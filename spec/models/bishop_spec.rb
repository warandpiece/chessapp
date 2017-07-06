require 'rails_helper'

RSpec.describe Bishop, type: :model do
  it "Bishop should inherit behavior from Piece" do 
    expect(Bishop.superclass).to eq(Piece)
  end
end