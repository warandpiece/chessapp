require 'pry'
require 'rails_helper'

RSpec.describe King, type: :model do
  it "King should inherit behavior from Piece" do 
    expect(King.superclass).to eq(Piece)
  end

  # VALID KING MOVES

  describe "CASTLING" do 
    let!(:king) { FactoryGirl.create(:king, current_x: 4, 
                                            current_y: 7,
                                            piece_color: "black") }
    let(:destination_x) { 2 }
    let(:destination_y) { 7 }

    context 'possible' do
      context 'king has not moved - rook on 0 - and NO pieces in between' do
        let!(:rook) { FactoryGirl.create(:rook, current_x: 0, 
                                            current_y: 7,
                                            piece_color: "black") }
        it 'should return TRUE if king has not moved' do
          expect(king.valid_move?(destination_x, destination_y)).to be(true)
        end
      end

      context 'king has not moved - rook on 7 - and NO pieces in between' do
        let(:destination_x) { 6 }
        let!(:rook) { FactoryGirl.create(:rook, current_x: 7, 
                                            current_y: 7,
                                            piece_color: "black") }
        it 'should return TRUE if king has not moved' do
          expect(king.valid_move?(destination_x, destination_y)).to be(true)
        end
      end

      context 'WHITE king has not moved - rook on 7 - and NO pieces in between' do
        let!(:king2) { FactoryGirl.create(:king, current_x: 4, 
                                            current_y: 0,
                                            piece_color: "white") }
        let!(:rook2) { FactoryGirl.create(:rook, current_x: 7, 
                                            current_y: 0,
                                            piece_color: "white") }
        let(:destination_x) { 6 }
        let(:destination_y) { 0 }

        it 'should return TRUE if white king is valid' do
          expect(king2.valid_move?(destination_x, destination_y)).to be(true)
        end
      end
    end

    context 'not possible' do
      context 'pieces in between' do
        let!(:bishop) { FactoryGirl.create(:bishop, current_x: 3, 
                                            current_y: 7,
                                            piece_color: "black") }

        it "should return false if pieces in between" do
          expect(king.valid_move?(destination_x, destination_y)).to be(false)
        end
      end

      context 'king has moved' do
      
        before do
         king.update_attribute(:current_x, 4)
        end

        it 'should return false if king has moved' do
          expect(king.valid_move?(destination_x, destination_y)).to be(false)
        end
      end

      context 'rook has moved' do
        let(:rook) { FactoryGirl.create(:rook, current_x: 1, 
                                            current_y: 7,
                                            piece_color: "black") }
        before do
         rook.update_attribute(:current_x, 0)
        end

        it 'should return false if rook has moved' do
          expect(king.valid_move?(destination_x, destination_y)).to be(false)
        end
      end
    end

  end

  describe "#valid_move? true" do 

    context "vertical moves" do 
      let!(:king) { FactoryGirl.create(:king, current_x: 3, current_y: 3) }
      let(:dest_x) { 3 }
      let(:dest_y_top) { 4 }
      let(:dest_y_bottom) { 2 }

      it "moves up 1" do
        expect(king.valid_move?(dest_x, dest_y_top)).to be true
      end

      it "moves down 1" do
        expect(king.valid_move?(dest_x, dest_y_bottom)).to be true
      end
    end

    context "horizontal moves" do 
      let!(:king) { FactoryGirl.create(:king, current_x: 3, current_y: 3) }
      let(:dest_x_right) { 4 }
      let(:dest_x_left) { 2 }
      let(:dest_y) { 3 }

      it "moves right 1" do
        expect(king.valid_move?(dest_x_right, dest_y)).to be true
      end

      it "moves left 1" do
        expect(king.valid_move?(dest_x_left, dest_y)).to be true
      end
    end

    context "diagonal moves" do 
      let!(:king) { FactoryGirl.create(:king, current_x: 3, current_y: 3) }
      let(:dest_x_right) { 4 }
      let(:dest_x_left) { 2 }
      let(:dest_y_top) { 4 }
      let(:dest_y_bottom) { 2 }

      it "moves upper right 1" do
        expect(king.valid_move?(dest_x_right, dest_y_top)).to be true
      end

      it "moves upper left 1" do
        expect(king.valid_move?(dest_x_left, dest_y_top)).to be true
      end

      it "moves lower right 1" do
        expect(king.valid_move?(dest_x_right, dest_y_bottom)).to be true
      end

      it "moves lower left 1" do
        expect(king.valid_move?(dest_x_left, dest_y_bottom)).to be true
      end
    end
  end

  # INVALID KING MOVES

  describe "#valid_move? false" do
    context "more than one square vertically" do
      let!(:king) { FactoryGirl.create(:king, current_x: 3, current_y: 3) }
      let(:dest_x) { 3 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it "should be false for multiple square move to top" do
        expect(king.valid_move?(dest_x, dest_y_top)).to be false
      end

      it "should be false for multiple square move to bottom" do
        expect(king.valid_move?(dest_x, dest_y_bottom)).to be false
      end
    end

    context "more than one square horizontally" do
      let!(:king) { FactoryGirl.create(:king, current_x: 3, current_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y) { 3 }

      it " should be false for multiple square move to right" do
        expect(king.valid_move?(dest_x_right, dest_y)).to be false
      end

      it " should be false for multiple square move to left" do
        expect(king.valid_move?(dest_x_left, dest_y)).to be false
      end
    end

    context "more than one square diagonally" do
      let!(:king) { FactoryGirl.create(:king, current_x: 3, current_y: 3) }
      let(:dest_x_right) { 5 }
      let(:dest_x_left) { 1 }
      let(:dest_y_top) { 5 }
      let(:dest_y_bottom) { 1 }

      it " should be false for multiple square move to upper right" do
        expect(king.valid_move?(dest_x_right, dest_y_top)).to be false
      end

      it " should be false for multiple square move to upper left" do
        expect(king.valid_move?(dest_x_left, dest_y_top)).to be false
      end
      
      it " should be false for multiple square move to lower right" do
        expect(king.valid_move?(dest_x_right, dest_y_bottom)).to be false
      end

      it " should be false for multiple square move to lower left" do
        expect(king.valid_move?(dest_x_left, dest_y_bottom)).to be false
      end
    end
  end
end