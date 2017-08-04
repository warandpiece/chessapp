require 'rails_helper'

RSpec.describe Knight, type: :model do
  it "Knight should inherit behavior from Piece" do 
    expect(Knight.superclass).to eq(Piece)
  end

  # VALID KNIGHT MOVES

  describe "#valid_move_knight?" do 
    context "8 point star" do 
      let!(:knight) { FactoryGirl.create(:knight, current_x: 3, current_y: 3) }
      let(:x_plus_1) { 4 }
      let(:x_plus_2) { 5 }
      let(:x_minus_1) { 2 }
      let(:x_minus_2) { 1 }
      let(:y_plus_1) { 4 }
      let(:y_plus_2) { 5 }
      let(:y_minus_1) { 2 }
      let(:y_minus_2) { 1 }

      it "over 1 up 2" do
        expect(knight.valid_move_knight?(x_plus_1, y_plus_2)).to be true
        expect(knight.valid_move_knight?(x_minus_1, y_plus_2)).to be true
      end

      it "over 1 down 2" do
        expect(knight.valid_move_knight?(x_plus_1, y_minus_2)).to be true
        expect(knight.valid_move_knight?(x_minus_1, y_minus_2)).to be true
      end

      it "over 2 up 1" do
        expect(knight.valid_move_knight?(x_plus_2, y_plus_1)).to be true
        expect(knight.valid_move_knight?(x_minus_2, y_plus_1)).to be true
      end

      it "over 2 down 1" do
        expect(knight.valid_move_knight?(x_plus_2, y_minus_1)).to be true
        expect(knight.valid_move_knight?(x_minus_2, y_minus_1)).to be true
      end
    end

# SHOULD NOT MOVE VERTICALLY, HORIZONTALLY, OR DIAGONALLY

    context "non valid moves should fail" do 
      let!(:knight) { FactoryGirl.create(:knight, current_x: 3, current_y: 3) }
      let(:current_x) { 3 }
      let(:x_plus_2) { 5 }
      let(:x_minus_2) { 1 }
      let(:current_y) { 3 }
      let(:y_plus_2) { 5 }
      let(:y_minus_2) { 1 }

      it "should not move vertically" do
        expect(knight.valid_move_knight?(x_plus_2, current_y)).to be false
        expect(knight.valid_move_knight?(x_minus_2, current_y)).to be false
      end

      it "should not move horizontally" do
        expect(knight.valid_move_knight?(current_x, y_plus_2)).to be false
        expect(knight.valid_move_knight?(current_x, y_minus_2)).to be false
      end

      it "should not move diagonally" do
        expect(knight.valid_move_knight?(x_plus_2, y_plus_2)).to be false
        expect(knight.valid_move_knight?(x_plus_2, y_minus_2)).to be false
        expect(knight.valid_move_knight?(x_minus_2, y_plus_2)).to be false
        expect(knight.valid_move_knight?(x_minus_2, y_minus_2)).to be false
      end
    end
  end
end