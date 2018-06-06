require 'rails_helper'

describe ChargesController, type: :controller do
  describe 'GET new' do
    it 'is a successfull response' do
      session[:current_transaction] = {}
      get :new

      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end
end
