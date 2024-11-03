# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    before { get :index }
    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'returns a proper response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
