module Rpn
  #
  # This error is thrown when the operation does not have enough
  # operands before trying to execute.
  #   For example:
  #     2 +
  #
  class InsufficientOperandsError < StandardError
  end

  #
  # This error is used whenever someone uses an input that is not in the
  # available list of operators and is not a valid number.
  #   For example:
  #      2 +6.5 +
  #
  class UnrecognizedInputError < StandardError
  end

  #
  # This error is thrown when the operation tries to divide by zero.
  #   For example:
  #      2 0 /
  #
  class DivisionByZeroError < StandardError
  end

  #
  # This error is thrown when a computation wasn't specified fully.
  #   For example:
  #     2 2 2 -
  #
  class ComputationIncompleteError < StandardError
  end
end
