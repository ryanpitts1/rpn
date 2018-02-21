require 'rpn/calculator'
require 'rpn/configuration'
require 'rpn/errors'
require 'rpn/repl'
require 'rpn/version'

module Rpn
  #
  # This tells the Rpn module that this instance variable is on the module scope.
  # attr_accessor is used to indicate that we’ll be reading whatever value is set here later.
  #
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
