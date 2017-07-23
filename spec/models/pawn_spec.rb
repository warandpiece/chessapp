require 'rails_helper'

RSpec.describe Pawn, type: :model do
  it "Pawn should inherit behavior from Piece" do 
    expect(Pawn.superclass).to eq(Piece)
  end

  describe "#valid_move?" do

    # FIRST MOVE VALID

    context "first moves valid" do 
      let!(:pawn1) { FactoryGirl.create(:pawn, piece_color: "white",
                                               current_position_x: 1, 
                                               current_position_y: 1) }
      let!(:pawn2) { FactoryGirl.create(:pawn, piece_color: "black",
                                               current_position_x: 1, 
                                               current_position_y: 6) }
      let(:current_position_x) { 1 }
      let(:y_plus_1) { 2 }
      let(:y_plus_2) { 3 }
      let(:y_minus_1) { 5 }
      let(:y_minus_2) { 4 }

      it "white pawn first move valid" do
        expect(pawn1.valid_move?(current_position_x, y_plus_1)).to be true
        expect(pawn1.valid_move?(current_position_x, y_plus_2)).to be true
      end

      it "black pawn first move valid" do
        expect(pawn2.valid_move?(current_position_x, y_minus_1)).to be true
        expect(pawn2.valid_move?(current_position_x, y_minus_1)).to be true
      end
    end

    # FIRST MOVE INVALID

    context "first moves invalid" do 
      let!(:pawn1) { FactoryGirl.create(:pawn, piece_color: "white",
                                               current_position_x: 1, 
                                               current_position_y: 1) }
      let!(:pawn2) { FactoryGirl.create(:pawn, piece_color: "black",
                                               current_position_x: 2, 
                                               current_position_y: 6) }
      let(:white_current_x) { 1 }
      let(:black_current_x) { 2 }
      let(:y_plus_3) { 4 }
      let(:y_minus_3) { 3 }

      it "white pawn first move invalid with 3 squares" do
        expect(pawn1.valid_move?(white_current_x, y_plus_3)).to be false
      end

      it "black pawn first move valid" do
        expect(pawn2.valid_move?(black_current_x, y_minus_3)).to be false
      end
    end

    # CANNOT GO BACKWARDS

    context "cannot go backwards" do 
      let!(:pawn1) { FactoryGirl.create(:pawn, piece_color: "white",
                                               current_position_x: 3, 
                                               current_position_y: 3) }
      let!(:pawn2) { FactoryGirl.create(:pawn, piece_color: "black",
                                               current_position_x: 3, 
                                               current_position_y: 4) }
      let(:current_position_x) { 3 }
      let(:white_y_minus_1) { 2 }
      let(:black_y_plus_1) { 5 }

      it "white pawn should not move backwards" do
        expect(pawn1.valid_move?(current_position_x, white_y_minus_1)).to be false
      end

      it "black pawn first move valid" do
        expect(pawn2.valid_move?(current_position_x, black_y_plus_1)).to be false
      end
    end

    # CANNOT MOVE HORIZONTALLY

    context "should not move horizontally" do 
      let!(:pawn) { FactoryGirl.create(:pawn, current_position_x: 3, 
                                              current_position_y: 3) }
      let(:dest_x_right) { 4 }
      let(:dest_x_left) { 2 }
      let(:dest_y) { 3 }

      it "moves right 1" do
        expect(pawn.valid_move?(dest_x_right, dest_y)).to be false
      end

      it "moves left 1" do
        expect(pawn.valid_move?(dest_x_left, dest_y)).to be false
      end
    end

    # IF NOT THE FIRST MOVE SHOULD MOVE ONE AND ONLY ONE SQUARE
    
    context "moving two squares should fail after first move" do 
      let!(:pawn1) { FactoryGirl.create(:pawn, piece_color: "white",
                                               current_position_x: 3, 
                                               current_position_y: 2) }
      let!(:pawn2) { FactoryGirl.create(:pawn, piece_color: "black",
                                               current_position_x: 3, 
                                               current_position_y: 5) }
      let(:current_position_x) { 3 }
      let(:y_plus_2) { 4 }
      let(:y_minus_2) { 3 }

      it "white pawn first move valid" do
        expect(pawn1.valid_move?(current_position_x, y_plus_2)).to be false
        expect(pawn2.valid_move?(current_position_x, y_minus_2)).to be false
      end
    end
  end
end