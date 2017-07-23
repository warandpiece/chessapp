require 'rails_helper'

RSpec.describe Queen, type: :model do
  it "Queen should inherit behavior from Piece" do 
    expect(Queen.superclass).to eq(Piece)
  end

  # SHOULD MOVE VERTICALLY 

  describe "#valid_move? true" do 
    context "vertical moves" do 
      let!(:queen) { FactoryGirl.create(:queen, current_position_x: 3, 
                                                current_position_y: 3) }
      let(:dest_x) { 3 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it "moves up" do
        expect(queen.valid_move?(dest_x, dest_y_top)).to be true
      end

      it "moves down" do
        expect(queen.valid_move?(dest_x, dest_y_bottom)).to be true
      end
    end

# SHOULD MOVE HORIZONTALLY

    context "horizontal moves" do 
      let!(:queen) { FactoryGirl.create(:queen, current_position_x: 3, 
                                                current_position_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y) { 3 }

      it "moves right" do
        expect(queen.valid_move?(dest_x_right, dest_y)).to be true
      end

      it "moves left" do
        expect(queen.valid_move?(dest_x_left, dest_y)).to be true
      end
    end

  # SHOULD MOVE DIAGONALLY

    context "diagonal moves" do 
      let!(:queen) { FactoryGirl.create(:queen, current_position_x: 3, 
                                                current_position_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it "moves upper right" do
        expect(queen.valid_move?(dest_x_right, dest_y_top)).to be true
      end

      it "moves upper left" do
        expect(queen.valid_move?(dest_x_left, dest_y_top)).to be true
      end

      it "moves lower right" do
        expect(queen.valid_move?(dest_x_right, dest_y_bottom)).to be true
      end

      it "moves lower left" do
        expect(queen.valid_move?(dest_x_left, dest_y_bottom)).to be true
      end
    end
  end
end