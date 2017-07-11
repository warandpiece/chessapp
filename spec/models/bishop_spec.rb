require 'rails_helper'

RSpec.describe Bishop, type: :model do
  it "Bishop should inherit behavior from Piece" do 
    expect(Bishop.superclass).to eq(Piece)
  end

  it 'has valid factory' do
    expect { FactoryGirl.create(:bishop) }.to change { Piece.count }
  end

  #describe '#is_obstructed' do
   # let(:bishop) { FactoryGirl.create(:bishop, ) }
    #it 'should return true if obstructed' do
     
     # expect()
      # use expect
      # provide params to is obstructed()
      # check the result
      # sometimes you may need let!

    #end
  #end
end

