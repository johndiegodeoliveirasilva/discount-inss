# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Finances::DashboardMetrics do
  describe '#call' do
    let(:current_user) { create(:user) }

    let(:subject) { described_class.new(current_user) }

    context 'when there are no proposers' do
      it 'returns the count of proposers' do
        expect(subject.call[:count_proposers]).to eq(0)
      end

      it 'returns the daily count of proposers' do
        expect(subject.call[:daily_proposers]).to eq(0)
      end

      it 'returns the group by income' do
        expect(subject.call[:group_by_income]).to eq([])
      end

      it 'returns the group keys' do
        expect(subject.call[:group_keys]).to eq([])
      end

      it 'returns the group values' do
        expect(subject.call[:group_values]).to eq([])
      end
    end

    context 'when there are proposers' do
      let!(:proposers1) { create_list(:proposer, 3, user: current_user, income: 4000) }
      let!(:proposers2) { create_list(:proposer, 2, user: current_user, income: 2000) }

      it 'returns the count of proposers' do
        expect(subject.call[:count_proposers]).to eq(5)
      end

      it 'returns the daily count of proposers' do
        expect(subject.call[:daily_proposers]).to eq(5)
      end

      it 'returns the group by income' do
        expect(subject.call[:group_by_income]).to eq([proposers1, proposers2].flatten)
      end

      it 'returns the group keys' do
        expect(subject.call[:group_keys]).to eq([3, 2])
      end

      it 'returns the group values' do
        expect(subject.call[:group_values]).to eq(['3134.41..6101.06', '1045.01..2089.6'])
      end
    end
  end
end
