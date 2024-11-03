# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProposersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }
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

    it 'assigns @proposers' do
      proposer = create(:proposer, user: user)
      expect(assigns(:proposers)).to eq([proposer])
    end

    context 'when using the search' do
      let(:proposer) { create(:proposer, full_name: 'John Doe', user: user) }
      it 'returns the proposer' do
        proposer
        get :index, params: { q: { full_name_cont: 'John' } }
        expect(assigns(:proposers)).to eq([proposer])
      end

      context 'when using multiples params' do
        it 'returns 5 proposers' do
          5.times { |i| create(:proposer, full_name: "John Doe #{i}", user: user) }

          get :index, params: { q: { full_name_cont: 'John' } }
          expect(assigns(:proposers).count).to eq(5)
        end
      end

      context 'when using the pagination' do
        it 'returns the proposer' do
          6.times { |i| create(:proposer, full_name: "John Doe #{i}", user: user) }

          get :index, params: { page: 2 }
          expect(assigns(:proposers).count).to eq(1)
        end
      end
    end
  end

  describe 'GET #show' do
    let(:proposer) { create(:proposer, user: user) }
    before do
      get :show, params: { id: proposer.id }
    end
    context 'when is valid' do
      it 'returns a success response' do
        expect(response).to be_successful
      end

      it 'returns a proper response' do
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'assigns @proposer' do
        expect(assigns(:proposer)).to eq(proposer)
      end

      it 'assigns @address' do
        expect(assigns(:address)).to eq(proposer.address)
      end
    end

    context 'when is invalid' do
      it 'returns a status code of :redirect' do
        get :show, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to the proposers_url' do
        get :show, params: { id: 0 }
        expect(response).to redirect_to(proposers_url)
      end

      it 'returns a flash alert' do
        get :show, params: { id: 0 }
        expect(flash[:alert]).to eq('Proposer not found.')
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'returns a proper response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it 'assigns @proposer' do
      expect(assigns(:proposer)).to be_a_new(Proposer)
    end

    it 'builds the address' do
      expect(assigns(:proposer).address).to be_present
    end
  end

  describe 'GET #edit' do
    let(:proposer) { create(:proposer) }

    context 'when is valid' do
      before { get :edit, params: { id: proposer.id } }

      it 'returns a success response' do
        expect(response).to be_successful
      end

      it 'returns a proper response' do
        expect(response).to have_http_status(200)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end

      it 'assigns @proposer' do
        expect(assigns(:proposer)).to eq(proposer)
      end

      it 'assigns @address' do
        expect(assigns(:address)).to eq(proposer.address)
      end
    end

    context 'when is invalid' do
      it 'returns a status code of :redirect' do
        get :edit, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to the proposers_url' do
        get :edit, params: { id: 0 }
        expect(response).to redirect_to(proposers_url)
      end

      it 'returns a flash alert' do
        get :edit, params: { id: 0 }
        expect(flash[:alert]).to eq('Proposer not found.')
      end
    end
  end

  describe 'POST #create' do
    context 'when is valid' do
      let(:valid_attributes) do
        {
          proposer: {
            document: '12345678901',
            full_name: 'Jane Doe',
            birth_date: '1990-01-01',
            phones_attributes: phones_attributes,
            address_attributes: address_attributes
          }
        }
      end

      let(:phones_attributes) do
        [
          { number: '123456789', phone_type: 'personal' },
          { number: '987654321', phone_type: 'reference' }
        ]
      end

      let(:address_attributes) do
        { zip_code: '12345678', street: 'Main St', number: '123', complement: 'Apt 1', neighborhood: 'Downtown',
          city: 'City', state: 'State' }
      end

      it 'creates a new Proposer' do
        expect do
          post :create, params: valid_attributes
        end.to change(Proposer, :count).by(1)
      end

      it 'returns a status code of :redirect' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:redirect)
      end

      it 'create phones' do
        post :create, params: valid_attributes

        expect(Proposer.last.phones.count).to eq(2)
      end

      it 'create address' do
        post :create, params: valid_attributes

        expect(Proposer.last.address).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          proposer: {
            document: '',
            full_name: '',
            birth_date: '1990-01-01',
            phones_attributes: [
              { number: '123456789', phone_type: 'personal' }
            ]
          }
        }
      end

      it 'does not create a new Proposer' do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(Proposer, :count)
      end

      it "re-renders the 'new' template" do
        post :create, params: { proposer: invalid_attributes }
        expect(response).to render_template(:new)

        expect(flash[:alert]).to include("can't be blank")
      end
    end
  end

  describe 'PUT #update' do
    let(:proposer) { create(:proposer) }

    context 'when is valid' do
      it 'updates the proposer' do
        put :update, params: { id: proposer.id, proposer: { full_name: 'Jane Doe' } }
        proposer.reload
        expect(proposer.full_name).to eq('Jane Doe')
      end
    end

    context 'when is invalid' do
      before { put :update, params: { id: proposer.id, proposer: { document: '' } } }

      it 'return a json with the errors' do
        expect(flash[:alert]).to include("can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:proposer) { create(:proposer) }

    context 'when is valid' do
      it 'deletes the proposer' do
        expect do
          delete :destroy, params: { id: proposer.id }
        end.to change(Proposer, :count).by(0)
      end

      it 'returns a status code of :redirect' do
        delete :destroy, params: { id: proposer.id }
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to the proposers_url' do
        delete :destroy, params: { id: proposer.id }
        expect(response).to redirect_to(proposers_url)
      end

      it 'returns a flash notice' do
        delete :destroy, params: { id: proposer.id }
        expect(flash[:notice]).to eq('Proposer was successfully destroyed.')
      end
    end

    context 'when is invalid' do
      it 'does not delete the proposer' do
        expect do
          delete :destroy, params: { id: 0 }
        end.to change(Proposer, :count).by(0)
      end

      it 'returns a status code of :redirect' do
        delete :destroy, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to the proposers_url' do
        delete :destroy, params: { id: 0 }
        expect(response).to redirect_to(proposers_url)
      end

      it 'returns a flash alert' do
        delete :destroy, params: { id: 0 }
        expect(flash[:alert]).to eq('Proposer not found.')
      end
    end
  end
end
