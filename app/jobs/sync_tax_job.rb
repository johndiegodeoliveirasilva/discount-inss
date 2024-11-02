# frozen_string_literal: true

class SyncTaxJob < ApplicationJob
  queue_as :high_priority

  def perform(proposer_id, income)
    proposer = Proposer.find(proposer_id)
    proposer.update(income: income)
  end
end
