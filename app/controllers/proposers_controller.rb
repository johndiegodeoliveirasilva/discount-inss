class ProposersController < ApplicationController
  before_action :authenticate_user!

  def create
    @proposer = Proposer.new(proposer_params)
    @proposer.user_id = current_user.id
    if @proposer.save
      render json: @proposer, status: :created
    else
      render json: @proposer.errors, status: :unprocessable_entity
    end
  end

  private

  def proposer_params
    params.require(:proposer).permit(:document, :full_name, :birth_date, phones_attributes: [:id, :number, :phone_type])
  end
end
