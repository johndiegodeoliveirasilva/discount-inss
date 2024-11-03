# frozen_string_literal: true

module Finances
  class DashboardMetrics
    attr_reader :current_user

    INCOME_RANGES = [
      { range: 0..1045.00 },
      { range: 1045.01..2089.60 },
      { range: 2089.61..3134.40 },
      { range: 3134.41..6101.06 }
    ].freeze

    def initialize(current_user)
      @current_user = current_user
      @range_counts = {}
    end

    def call
      {
        count_proposers: count_proposers,
        daily_proposers: daily_proposers,
        group_by_income: group_by_income,
        group_keys: range_values,
        group_values: range_labels
      }
    end

    private

    def group_by_income
      current_user.proposers.each do |proposer|
        INCOME_RANGES.each do |income_range|
          income_range = income_range[:range].to_s
          next unless income_range.cover?(proposer.income.to_f)

          @range_counts[income_range] = 0 if @range_counts[income_range].nil?
          @range_counts[income_range] += 1

          break
        end
      end
    end

    def range_labels
      @range_labels = @range_counts.keys
    end

    def range_values
      @range_values = @range_counts.values
    end

    def count_proposers
      current_user.proposers.count
    end

    def daily_proposers
      current_user.proposers.where(created_at: Time.current.to_date.all_day).count
    end
  end
end
