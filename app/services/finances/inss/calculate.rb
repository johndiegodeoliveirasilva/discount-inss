module Finances
  module Inss
    class Calculate

      CONTRIBUTION_TABLE = [
        { limit: 1045.00, aliquot: 0.075 },
        { limit: 2089.60, aliquot: 0.09 },
        { limit: 3134.40, aliquot: 0.12 },
        { limit: 6101.06, aliquot: 0.14 }
      ]

      attr_reader :base_salary
      def initialize(base_salary)
        @base_salary = base_salary.to_f
      end

      def call
        return 0 if base_salary.zero?

        total_inss = 0
        rest_salary = base_salary

        CONTRIBUTION_TABLE.each_with_index do |contribution, index|
          range_value = calculate_range_value(contribution, index, rest_salary)
          total_inss += (range_value * contribution[:aliquot]).floor(2)
          rest_salary -= range_value
          break if rest_salary <= 0
        end
        total_inss.round(2)
      end

      private

      def calculate_range_value(contribution, index, rest_salary)
        if index == 0
          [contribution[:limit], rest_salary].min
        else
          previous_limit = CONTRIBUTION_TABLE[index - 1][:limit]
          if rest_salary <= previous_limit
            base_salary - previous_limit
          else
            [contribution[:limit] - previous_limit, rest_salary].min
          end
        end
      end
    end
  end
end
