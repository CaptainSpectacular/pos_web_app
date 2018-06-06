require 'rails_helper'

describe TransactionController, type: :controller do
  describe 'POST update' do
    it 'can add to new transactions' do
      session[:current_transaction] = {}
      post :update, params: { card: 'Food Chain', quantity: '3' }

      expected = { 'Food Chain' => 3 }

      expect(session[:current_transaction]).to eq(expected)
    end

    it 'can add to exisiting transactions' do
      session[:current_transaction] = { 'Food Chain' => 2 }
      post :update, params: { card: 'Food Chain', quantity: '3' }

      expected = { 'Food Chain' => 5 }

      expect(session[:current_transaction]).to eq(expected)
    end

    it 'can remove from exisiting transactions' do
      session[:current_transaction] = { 'Food Chain' => -2 }
      post :update, params: { card: 'Food Chain', quantity: '3' }

      expected = { 'Food Chain' => 1 }

      expect(session[:current_transaction]).to eq(expected)
    end
    
    it 'can remove an item from exisiting transactions' do
      session[:current_transaction] = { 'Food Chain' => -3 }
      post :update, params: { card: 'Food Chain', quantity: '3' }

      expect(session[:current_transaction]).to eq({})
    end
  end
end
