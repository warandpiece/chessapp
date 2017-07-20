require 'rails_helper'

RSpec.describe Piece, type: :model do
  it 'has valid factory' do
    expect { FactoryGirl.create(:piece) }.to change { Piece.count }
  end

  it 'has valid factory' do
    expect { FactoryGirl.create(:bishop) }.to change { Piece.count }
  end

  it 'has valid factory' do
    expect { FactoryGirl.create(:rook) }.to change { Piece.count }
  end

# HORIZONTAL OBSTRUCTION

#   describe 'piece obstructed horizontally' do
#     context 'left to right' do
#       let!(:rook1) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 0) }
#       let!(:rook2) { FactoryGirl.create(:rook, current_position_x: 3, current_position_y: 0) }
#       let(:dest_x) { 5 }
#       let(:dest_y) { 0 }
#       it 'should return true (move 0,0 to 5,0 blocked on 3,0)' do
#         expect(rook1.is_move_blocked(dest_x,dest_y)).to be true
#       end
#     end
#     context 'right to left' do
#       let!(:rook1) { FactoryGirl.create(:rook, current_position_x: 5, current_position_y: 0) }
#       let!(:rook2) { FactoryGirl.create(:rook, current_position_x: 3, current_position_y: 0) }
#       let(:dest_x) { 0 }
#       let(:dest_y) { 0 }
#       it 'should return true (move 5,0 to 0,0 blocked on 3,0)' do
#         expect(rook1.is_move_blocked(dest_x,dest_y)).to be true
#       end
#     end
#   end

#   describe 'piece NOT obstructed horizontally' do
#     let!(:rook1) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 0) }
#     let!(:rook2) { FactoryGirl.create(:rook, current_position_x: 5, current_position_y: 0) }
#     let(:dest_x) { 3 }
#     let(:dest_y) { 0 }
#     it 'should return false (move 0,0 to 3,0)' do
#       expect(rook1.is_move_blocked(dest_x,dest_y)).to be false
#     end
#     it 'should return false (move 5,0 to 3,0)' do
#       expect(rook2.is_move_blocked(dest_x,dest_y)).to be false
#     end
#   end

# # VERTICAL OBSTRUCTION

# describe 'piece obstructed vertically' do
#   context 'bottom to top' do
#     let!(:rook1) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 0) }
#     let!(:rook2) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 3) }
#     let(:dest_x) { 0 }
#     let(:dest_y) { 5 }
#     it 'should return true (move 0,0 to 0,5 blocked on 0,3)' do
#       expect(rook1.is_move_blocked(dest_x,dest_y)).to be true
#     end
#   end
#   context 'top to bottom' do
#     let!(:rook1) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 5) }
#     let!(:rook2) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 3) }
#     let(:dest_x) { 0 }
#     let(:dest_y) { 0 }
#     it 'should return true (move 0,5 to 0,0 blocked on 0,3)' do
#       expect(rook1.is_move_blocked(dest_x,dest_y)).to be true
#     end
#   end
# end

# describe 'piece NOT obstructed vertically' do
#   let!(:rook1) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 0) }
#   let!(:rook2) { FactoryGirl.create(:rook, current_position_x: 0, current_position_y: 5) }
#   let(:dest_x) { 0 }
#   let(:dest_y) { 3 }
#   it 'should return false (move 0,0 to 0,3)' do
#     expect(rook1.is_move_blocked(dest_x,dest_y)).to be false
#   end
#   it 'should return false (move 0,5 to 0,3)' do
#     expect(rook2.is_move_blocked(dest_x,dest_y)).to be false
#   end
# end

# # DIAGONAL OBSTRUCTION

# describe 'piece obstructed diagonally' do
#   context 'bottom right to upper left' do
#     let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 0) }
#     let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 3, current_position_y: 4) }
#     let(:dest_x) { 0 }
#     let(:dest_y) { 7 }
#     it 'should return true (move 7,0 to 0,7 blocked on 3,4)' do
#       expect(bishop1.is_move_blocked(dest_x,dest_y)).to be true
#     end
#   end

#   context 'upper right to bottom left' do
#     let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 0, current_position_y: 7) }
#     let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 3, current_position_y: 4) }
#     let(:dest_x) { 7 }
#     let(:dest_y) { 0 }
#     it 'should return true (move 0,7 to 7,0 blocked on 3,4)' do
#       expect(bishop1.is_move_blocked(dest_x ,dest_y)).to be true
#     end
#   end
# end

# describe 'piece obstructed bottom left to upper right' do
#   let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 0, current_position_y: 0) }
#   let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 4, current_position_y: 4) }
#   let(:dest_x) { 7 }
#   let(:dest_y) { 7 }
#   it 'should return true (move 0,0 to 7,7 blocked on 4,4)' do
#     expect(bishop1.is_move_blocked(dest_x,dest_y)).to be true
#   end
# end

# describe 'piece obstructed upper right to bottom left' do
#   let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 7) }
#   let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 4, current_position_y: 4) }
#   let(:dest_x) { 0 }
#   let(:dest_y) { 0 }
#   it 'should return true (move 7,7 to 0,0 blocked on 4,4)' do
#     expect(bishop1.is_move_blocked(dest_x,dest_y)).to be true
#   end
# end

#   describe 'piece NOT obstructed' do
#     #one piece in each corner
#     let!(:bishop1) { FactoryGirl.create(:bishop, current_position_x: 0, current_position_y: 0) }
#     let!(:bishop2) { FactoryGirl.create(:bishop, current_position_x: 0, current_position_y: 7) }
#     let!(:bishop3) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 0) }
#     let!(:bishop4) { FactoryGirl.create(:bishop, current_position_x: 7, current_position_y: 7) }

#     let(:dest_x) { 4 }
#     let(:dest_y) { 4 }

#     context 'upper left to bottom right and viceversa' do
#       it 'should return false (move 0,0 to 4,4)' do
#         expect(bishop1.is_move_blocked(dest_x,dest_y)).to be false
#       end
#       it 'should return false (move 0,7 to 4,4)' do
#         expect(bishop2.is_move_blocked(dest_x ,dest_y)).to be false
#       end
#     end

#     context 'upper right to bottom left and viceversa' do
#       it 'should return false (move 7,0 to 4,4)' do
#         expect(bishop3.is_move_blocked(dest_x,dest_y)).to be false
#       end
#       it 'should return false (move 7,7 to 4,4)' do
#         expect(bishop4.is_move_blocked(dest_x ,dest_y)).to be false
#       end
#     end
#  end
end


