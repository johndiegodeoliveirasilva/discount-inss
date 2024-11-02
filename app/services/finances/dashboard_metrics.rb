module Finances
  class DashboardMetrics
    attr_reader :current_user
    RANGE = [['0', '1045.00'], ['1045.01', '2089.60'],  ['2089.61', '3134.40'], ['3134.41', '6101.06']]

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
        RANGE.each do |lower_bound, upper_bound|
          if proposer.income > lower_bound.to_f && proposer.income <= upper_bound.to_f
            @range_counts["#{lower_bound}-#{upper_bound}"] = 0 if @range_counts["#{lower_bound}-#{upper_bound}"].nil?
            @range_counts["#{lower_bound}-#{upper_bound}"] += 1

            break
          end
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
      current_user.proposers.where(created_at: Date.today.all_day).count
    end
  end
end