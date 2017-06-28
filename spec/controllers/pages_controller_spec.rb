require 'rails_helper'
 
RSpec.describe PagesController, type: :controller do 
  describe "pages#index" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end