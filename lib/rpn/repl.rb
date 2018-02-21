require 'rpn/calculator'

module Rpn
  REPL_PREFIX = '> '.freeze

  #
  # This Repl class creates a Read Eval Print Loop that the user can use
  # to input values to be calculated and see the results in the output.
  #
  # The user can enter 'q' or hit 'ctrl+d' to exit the interface.
  #
  class Repl
    def initialize
      @calculator = Rpn::Calculator.new
      repl
    end

    def repl
      print REPL_PREFIX

      loop do
        input = gets

        if input.nil? || input.chomp == 'q'
          exit
        end

        begin
          @calculator.compute(input.chomp, true)
        rescue Rpn::UnrecognizedInputError => error
          puts error.message
        rescue DivisionByZeroError => error
          puts error.message
        rescue Rpn::InsufficientOperandsError => error
          puts error.message
        end

        if @calculator.result.nil?
          puts 'nil'
        elsif @calculator.result.is_a? Array
          puts @calculator.result.join(', ')
        else
          puts @calculator.result
        end

        print REPL_PREFIX
      end
    end
  end
end
