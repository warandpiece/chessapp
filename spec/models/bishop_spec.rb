require 'rails_helper'

RSpec.describe Bishop, type: :model do
  it "Bishop should inherit behavior from Piece" do 
    expect(Bishop.superclass).to eq(Piece)
  end

  it 'has valid factory' do
    expect { FactoryGirl.create(:bishop) }.to change { Piece.count }
  end

  # SHOULD MOVE DIAGONALLY

  describe "#valid_move_bishop? true" do 
    context "diagonal moves" do 
      let!(:bishop) { FactoryGirl.create(:bishop, current_position_x: 3, 
                                                  current_position_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it "moves upper right" do
        expect(bishop.valid_move_bishop?(dest_x_right, dest_y_top)).to be true
      end

      it "moves upper left" do
        expect(bishop.valid_move_bishop?(dest_x_left, dest_y_top)).to be true
      end

      it "moves lower right" do
        expect(bishop.valid_move_bishop?(dest_x_right, dest_y_bottom)).to be true
      end

      it "moves lower left" do
        expect(bishop.valid_move_bishop?(dest_x_left, dest_y_bottom)).to be true
      end
    end

    # SHOULD NOT MOVE VERTICALLY OR HORIZONTALLY

    context "Should not move vertically" do 
      let!(:bishop) { FactoryGirl.create(:bishop, current_position_x: 3, 
                                                  current_position_y: 3) }
      let(:dest_x) { 3 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it "moves up 1" do
        expect(bishop.valid_move_bishop?(dest_x, dest_y_top)).to be false
      end

      it "moves down 1" do
        expect(bishop.valid_move_bishop?(dest_x, dest_y_bottom)).to be false
      end
    end

    context "should not move horizontally" do 
      let!(:bishop) { FactoryGirl.create(:bishop, current_position_x: 3, 
                                                  current_position_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y) { 3 }

      it "moves right 1" do
        expect(bishop.valid_move_bishop?(dest_x_right, dest_y)).to be false
      end

      it "moves left 1" do
        expect(bishop.valid_move_bishop?(dest_x_left, dest_y)).to be false
      end
    end

  end
end
