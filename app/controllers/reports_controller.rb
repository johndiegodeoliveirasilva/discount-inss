# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: @user, status: :ok
  end

  private

  def user
    @user = 'hello'
  end
end
