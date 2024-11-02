# frozen_string_literal: true

class FinancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @proposer_id = params[:proposer_id]
  end

  def calculate
    render json: { amount: rand(151) }
  end

  def sync_tax
    render json: { message: 'Taxa sincronizada com sucesso.' }, status: :ok
  end
end
