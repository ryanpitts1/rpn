module Rpn
  #
  # The Configuration class is used to allow the user to specify
  # the operators and REPL prefeix they would like to use.
  # Defaults are provided as well.
  #
  class Configuration
    attr_accessor :operators, :repl_prefix

    def initialize
      @operators = {
        '+' => :+,
        '-' => :-,
        '*' => :*,
        '/' => :/
      }
    end
  end
end
