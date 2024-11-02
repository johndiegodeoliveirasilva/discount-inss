# frozen_string_literal: true

class FinancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @proposer_id = params[:proposer_id]
  end

  def calculate
    amount = Finances::Inss::Calculate.new(params[:salary]).call
    render json: { amount: amount }, status: :ok
  end

  def sync_tax
    SyncTaxJob.perform_later(params[:propose_id], params[:new_price])
    flash[:notice] = 'Proposer was successfully created.'
    render json: { message: 'Syncing...' }, status: :ok
  end
end
