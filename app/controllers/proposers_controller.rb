# frozen_string_literal: true

class ProposersController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @proposer = Proposer.new

    respond_to do |format|
      format.html
      format.json { render json: @proposer }
    end
  end

  def create
    @proposer = Proposer.new(proposer_params)
    @proposer.user_id = current_user.id

    if @proposer.save
      redirect_to :root
    else
      render json: @proposer.errors, status: :unprocessable_entity
    end
  end

  private

  def proposer_params
    params.require(:proposer).permit(:document, :full_name, :birth_date, phones_attributes: %i[id number phone_type])
  end
end
