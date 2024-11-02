# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Finances::Inss::Calculate do
  describe '#call' do
    let(:subject) { described_class.new(salary) }

    context 'when base salary is 0' do
      let(:salary) { 0 }
      it 'returns 0' do
        expect(subject.call).to eq(0)
      end
    end

    context 'when base salary is 1045.00' do
      let(:salary) { 1045.00 }
      it 'returns 78.38' do
        expect(subject.call).to eq(78.37)
      end
    end

    context 'when base salary is 1045.01' do
      let(:salary) { 1045.01 }

      it 'returns 78.37' do
        expect(subject.call).to eq(78.37)
      end
    end

    context 'when base salary is 2089.60' do
      let(:salary) { 2089.60 }

      it 'returns 172.38' do
        expect(subject.call).to eq(172.38)
      end
    end

    context 'when base salary is 3000' do
      let(:salary) { 3000 }

      it 'returns 281.62' do
        expect(subject.call).to eq(281.62)
      end
    end

    context 'when base salary is 2500' do
      let(:salary) { 2500 }

      it 'returns 221.62' do
        expect(subject.call).to eq(221.62)
      end
    end

    context 'when base salary is 6101.06' do
      let(:salary) { 6101.06 }

      it 'returns 713.08' do
        expect(subject.call).to eq(713.08)
      end
    end
  end
end
