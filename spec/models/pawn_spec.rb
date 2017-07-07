require 'rails_helper'

RSpec.describe Pawn, type: :model do
  it "Pawn should inherit behavior from Piece" do 
    expect(Pawn.superclass).to eq(Piece)
  end
end