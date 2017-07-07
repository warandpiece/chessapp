require 'rails_helper'

RSpec.describe Queen, type: :model do
  it "Queen should inherit behavior from Piece" do 
    expect(Queen.superclass).to eq(Piece)
  end
end