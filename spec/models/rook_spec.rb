require 'rails_helper'

RSpec.describe Rook, type: :model do
  it "Rook should inherit behavior from Piece" do 
    expect(Rook.superclass).to eq(Piece)
  end

# SHOULD MOVE VERTICALLY AND HORIZONTALLY

   describe "#valid_move? true" do 
    context "vertical moves" do 
      let!(:rook) { FactoryGirl.create(:rook, current_x: 3, current_y: 3) }
      let(:dest_x) { 3 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it "moves up" do
        expect(rook.valid_move?(dest_x, dest_y_top)).to be true
      end

      it "moves down" do
        expect(rook.valid_move?(dest_x, dest_y_bottom)).to be true
      end
    end

    context "horizontal moves" do 
      let!(:rook) { FactoryGirl.create(:rook, current_x: 3, current_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y) { 3 }

      it "moves right" do
        expect(rook.valid_move?(dest_x_right, dest_y)).to be true
      end

      it "moves left" do
        expect(rook.valid_move?(dest_x_left, dest_y)).to be true
      end
    end
  end

# SHOULD NOT MOVE DIADONALLY

  describe "#valid_move? false" do 
    context "It should not move diagonally" do 
      let!(:rook) { FactoryGirl.create(:rook, current_x: 3, current_y: 3) }
      let(:dest_x_right) { 4 }
      let(:dest_x_left) { 2 }
      let(:dest_y_top) { 4 }
      let(:dest_y_bottom) { 2 }

      it "move upper right" do
        expect(rook.valid_move?(dest_x_right, dest_y_top)).to be false
      end

      it "move upper left" do
        expect(rook.valid_move?(dest_x_left, dest_y_top)).to be false
      end

      it "moves lower right" do
        expect(rook.valid_move?(dest_x_right, dest_y_bottom)).to be false
      end

      it "moves lower left" do
        expect(rook.valid_move?(dest_x_left, dest_y_bottom)).to be false
      end
    end
  end
end
