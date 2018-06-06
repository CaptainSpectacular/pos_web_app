require 'rails_helper'

describe ImportExportController, type: :controller do
  let(:inventory) { create(:inventory) }
  let(:csv) { fixture_file_upload('import_test.csv') }
    
  describe 'GET show' do
    it 'responds with a csv format' do
      sign_in inventory.user
      @current_inventory = inventory
      get :show, params: { slug: inventory.name }

      expect(response.status).to eq(200)
      expect(response.content_type).to eq('text/csv')
    end
  end

  describe 'POST create' do
    it 'imports a csv' do
      sign_in inventory.user
      post :create, params: { slug: inventory.name, file: { csv: csv } } 

      expect(response.status).to eq(302)
      expect(response).to redirect_to(inventory_path(inventory))
      expect(flash[:success]).to match("CSV successfully imported")
    end
  end
end
