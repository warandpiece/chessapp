require 'rails_helper'

RSpec.describe King, type: :model do
  it "King should inherit behavior from Piece" do 
    expect(King.superclass).to eq(Piece)
  end

  describe "#valid_move?" do 
    context "should be true for valid move"
    it "vertical moves" do
      let!(:king) { FactoryGirl.create(:king, current_position_x: 3, 
                                              current_position_y: 3) }
      let(:dest_x) { 3 }
      let(:dest_y) { 4 }
      
      expect(king.valid_move?(is_move_blocked(dest_x,dest_y)).to be true
    end

    it "should be false for invalid move" do 

    end
  end
end