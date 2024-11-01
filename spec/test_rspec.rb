# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test', type: :service do
  describe 'teste' do
    let(:user) { create(:user) }
    it 'test' do
      expect(user).to be_valid
    end

    it 'test' do
      expect(user).to be_valid
    end
    it 'test' do
      expect(user).to be_valid
    end
    it 'test' do
      expect(user).to be_valid
    end
    it 'test' do
      expect(user).to be_valid
    end
  end
end
