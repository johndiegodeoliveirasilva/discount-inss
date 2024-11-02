# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless current_user

    result = Finances::DashboardMetrics.new(current_user).call
    @today_proposer = result[:daily_proposers]
    @total_proposer = result[:count_proposers]
    @statuses = result[:group_values]
    @counts = result[:group_keys]
  end
end
