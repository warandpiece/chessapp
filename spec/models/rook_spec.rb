require 'rails_helper'

RSpec.describe Rook, type: :model do
  it "Rook should inherit behavior from Piece" do 
    expect(Rook.superclass).to eq(Piece)
  end
end
