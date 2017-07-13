require 'rails_helper'

RSpec.describe Piece, type: :model do
  it 'has valid factory' do
    expect { FactoryGirl.create(:piece) }.to change { Piece.count }
  end

  describe 'is_position_occupied' do
  	let(:piece) { FactoryGirl.create(:piece, current_position_x: 2, current_position_y: 2) }
    it 'should return true if position is occupied' do
    	expect(piece.is_position_occupied(2,2)).to be true
    end
    it 'should return false if position is NOT occupied' do
      expect(piece.is_position_occupied(5,5)).to be false
    end
    
  end
end