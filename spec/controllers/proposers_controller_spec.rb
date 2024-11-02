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
      proposer = create(:proposer)
      expect(assigns(:proposers)).to eq([proposer])
    end

    context "when using the search" do
      let(:proposer) { create(:proposer, full_name: 'John Doe') }
      it 'returns the proposer' do
        proposer
        get :index, params: { q: { full_name_cont: "John" } }
        expect(assigns(:proposers)).to eq([proposer])
      end

      context "when using multiples params" do
        it 'returns 5 proposers' do
          5.times { |i| create(:proposer, full_name: "John Doe #{i}") }

          get :index, params: { q: { full_name_cont: "John" } }
          expect(assigns(:proposers).count).to eq(5)
        end
      end

      context "when using the pagination" do
        it 'returns the proposer' do
          6.times { |i| create(:proposer, full_name: "John Doe #{i}") }

          get :index, params: { page: 2 }
          expect(assigns(:proposers).count).to eq(1)
        end
      end
    end
  end

  describe 'GET #new' do
  end

  describe 'GET #edit' do
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
        { zip_code: '12345678', street: 'Main St', number: '123', complement: 'Apt 1', neighborhood: 'Downtown', city: 'City', state: 'State'}
      end

      it 'creates a new Proposer' do
        expect {
          post :create, params: valid_attributes
        }.to change(Proposer, :count).by(1)
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
        expect {
          post :create, params: invalid_attributes
        }.not_to change(Proposer, :count)
      end

      it 'returns a status code of :unprocessable_entity' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the errors as JSON' do
        post :create, params: invalid_attributes
        json_response = JSON.parse(response.body)
        expect(json_response).to include("document", "full_name")
      end
    end
  end

  describe 'PUT #update' do
  end

  describe 'DELETE #destroy' do
  end
end
