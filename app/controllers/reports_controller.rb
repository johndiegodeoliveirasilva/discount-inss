# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :authenticate_user!
  #before_action :user, only: %i[show]

  def show

    render json: @user, status: :ok
  end

  private

  def user
    @user = "hello"
  end
end
