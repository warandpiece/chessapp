require 'rails_helper'

RSpec.describe Bishop, type: :model do
  it "Bishop should inherit behavior from Piece" do 
    expect(Bishop.superclass).to eq(Piece)
  end

  it 'has valid factory' do
    expect { FactoryGirl.create(:bishop) }.to change { Piece.count }
  end

  describe 'bishop obstructed bottom left to upper right' do
    let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 1, current_position_y: 1) }
    let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 4, current_position_y: 4) }
    let(:dest_x) { 7 }
    let(:dest_y) { 7 }
    it 'should return true (move 1,1 to 7,7 blocked on 4,4)' do
      expect(bishop1.is_bishop_move_blocked(dest_x,dest_y)).to be true
    end
  end

  describe 'bishop obstructed upper right to bottom left' do
    let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 7) }
    let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 4, current_position_y: 4) }
    let(:dest_x) { 1 }
    let(:dest_y) { 1 }
    it 'should return true (move 7,7 to 1,1 blocked on 4,4)' do
      expect(bishop1.is_bishop_move_blocked(dest_x,dest_y)).to be true
    end
  end

  describe 'bishop obstructed' do
    context 'bottom right to upper left' do
      let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 1) }
      let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 4, current_position_y: 4) }
      let(:dest_x) { 1 }
      let(:dest_y) { 7 }
      it 'should return true (move 7,1 to 1,7 blocked on 4,4)' do
        expect(bishop1.is_bishop_move_blocked(dest_x,dest_y)).to be true
      end
    end

    context 'upper right to bottom left' do
      let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 1, current_position_y: 7) }
      let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 4, current_position_y: 4) }
      let(:dest_x) { 7 }
      let(:dest_y) { 1 }
      it 'should return true (move 1,7 to 7,1 blocked on 4,4)' do
        expect(bishop1.is_bishop_move_blocked(dest_x ,dest_y)).to be true
      end
    end
  end

  describe 'bishop NOT obstructed' do
    #one piece in each corner
    let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 1, current_position_y: 1) }
    let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 1, current_position_y: 7) }
    let!(:bishop3) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 1) }
    let!(:bishop4) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 7) }

    let(:dest_x) { 4 }
    let(:dest_y) { 4 }

    context 'upper left to bottom right and viceversa' do
      it 'should return false (move 1,1 to 4,4)' do
        expect(bishop1.is_bishop_move_blocked(dest_x,dest_y)).to be false
      end
      it 'should return false (move 1,7 to 4,4)' do
        expect(bishop2.is_bishop_move_blocked(dest_x ,dest_y)).to be false
      end
    end

    context 'upper right to bottom left and viceversa' do
      it 'should return false (move 7,1 to 4,4)' do
        expect(bishop3.is_bishop_move_blocked(dest_x,dest_y)).to be false
      end
      it 'should return false (move 7,7 to 4,4)' do
        expect(bishop4.is_bishop_move_blocked(dest_x ,dest_y)).to be false
      end
    end
  end

  

end

