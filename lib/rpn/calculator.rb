module Rpn
  #
  # The Calculator class will instantiate a parse and then take the
  # user's input and interpret it, raising any erorrs if necessary.
  #
  class Calculator
    def self.compute(str)
      Calculator.new.compute(str)
    end

    def initialize(calculation = '')
      @stack = []
      compute(calculation)
    end

    def result
      if @stack.empty?
        nil
      elsif @stack.length == 1
        @stack[0]
      else
        @stack
      end
    end

    def compute(calculation, cli = false)
      calculation.split.map do |token|
        if Rpn.configuration.operators.include?(token)
          raise InsufficientOperandsError.new, 'Not enough operands' if @stack.length < 2

          lhs, rhs = @stack.pop(2)
          unless cli || !@stack.length.zero?
            @stack = []
          end

          handle_operation(lhs, rhs, token)
        elsif token.match(/\A(?:\-)?\d+(?:\.\d+)?\z/)
          @stack << token.to_f
        else
          raise UnrecognizedInputError.new, "'#{token}' is an unrecognized input"
        end
      end

      unless cli
        raise ComputationIncompleteError.new, 'The computation is not complete' if @stack.length > 1

        @stack.last
      end
    end

    def handle_operation(lhs, rhs, operation)
      if Rpn.configuration.operators[operation] == :/ && rhs.zero?
        @stack << 0.0
        raise DivisionByZeroError.new, 'You cannot divide by zero'
      end

      @stack << lhs.send(Rpn.configuration.operators[operation], rhs)
    end
  end
end
