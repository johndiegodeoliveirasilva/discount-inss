# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinancesController, type: :controller do
  let(:user) { create(:user) }
  let(:proposer) { create(:proposer, user: user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'render index' do
      get :new, params: { proposer_id: 1 }
      expect(response).to render_template :new
      expect(assigns(:proposer_id)).to eq('1')
    end
  end

  describe 'POST #calculate' do
    it 'returns status success' do
      post :calculate, params: { proposer_id: proposer.id, value: 1000 }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #sync_tax' do
    it 'enqueues job' do
      expect do
        post :sync_tax, params: { proposer_id: proposer.id, new_price: 2000 }
      end.to have_enqueued_job(SyncTaxJob)
    end

    it 'returns status success' do
      post :sync_tax, params: { proposer_id: proposer.id, new_price: 2000 }
      expect(response).to have_http_status(:success)
    end
  end
end
