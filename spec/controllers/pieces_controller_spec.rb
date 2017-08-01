require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  describe "pieces#update" do
    it 'should update current_postition_x and current_postition_y' do
      white_player = FactoryGirl.create(:white_player)
      sign_in white_player
      game = FactoryGirl.create(:game, :full)
  
      put :update, params: { type: pawn, current_postition_x: 6, current_postition_y: 6}
      pawn.reload
      game.reload

      expect(pawn.current_postition_x).to eq 6
      expect(pawn.current_postition_y). to eq 6
    end
  end
end