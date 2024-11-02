# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SyncTaxJob, type: :job do
  describe '#perform' do
    let(:proposer) { create(:proposer, income: 3000) }
    let(:new_income) { 2718.38 }

    it 'updates the proposer income' do
      described_class.perform_now(proposer.id, new_income)
      proposer.reload
      expect(proposer.income).to eq(new_income)
    end

    it 'enqueues the job' do
      expect { described_class.perform_later(proposer.id, new_income) }
        .to have_enqueued_job(described_class)
        .with(proposer.id, new_income)
        .on_queue('high_priority')
    end

    it 'raises and error if the proposer do not exist' do
      expect { described_class.perform_now(0, new_income) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
