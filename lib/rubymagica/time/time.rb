require 'delta_time_calculator'

module Rubymagica
  class Time
    class << self
      def reset
        @calculator = Helper::Time::TimeDifferenceCalculator.new
      end

      def calculator
        reset if @calculator.nil?
        @calculator
      end

      def delta
        calculator.delta
      end

      def update(time)
        calculator.update time
      end

      private_class_method :new
    end
  end
end
