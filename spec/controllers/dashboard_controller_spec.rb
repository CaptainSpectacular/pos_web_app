require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET show' do
    it 'is a successfull request' do
      get :show

      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end
end
