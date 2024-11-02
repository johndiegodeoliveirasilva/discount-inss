# frozen_string_literal: true

class ProposersController < ApplicationController
  before_action :authenticate_user!
  before_action :proposer, only: %i[show edit update destroy]

  def index
    @proposers = Proposer.page(params[:page]).per(5)
  end

  def new
    @proposer = Proposer.new
    @proposer.build_address

    respond_to do |format|
      format.html
      format.json { render json: @proposer }
    end
  end

  def edit
    @address = @proposer.address
  end

  def update
    if @proposer.update(proposer_params)
      flash[:notice] = 'Proposer was successfully updated.'
      redirect_to proposers_url
    else
      flash[:alert] = 'Proposer was not updated.'
      render json: @proposer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @proposer.destroy

    respond_to do |format|
      format.html { redirect_to proposers_url, notice: 'Proposer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @proposer = Proposer.new(proposer_params)
    @proposer.user_id = current_user.id

    if @proposer.save
      redirect_to new_proposer_finance_url(@proposer)
    else
      render json: @proposer.errors, status: :unprocessable_entity
    end
  end

  private

  def proposer
    @proposer = Proposer.find(params[:id])
  end

  def proposer_params
    params.require(:proposer).permit(:document, :full_name, :birth_date, phones_attributes: %i[id number phone_type],
                                                                         address_attributes: %i[id zip_code state city
                                                                                                neighborhood number
                                                                                                complement])
  end
end
