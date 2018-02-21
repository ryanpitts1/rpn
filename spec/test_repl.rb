require 'spec_helper'

RSpec.describe "when using the repl cli" do
  context "sums the value of two numbers" do
    command "rpn 2 3 +"
    its(:stdout) { is_expected.to eq("5.0\n") }
  end

  context "subtracts the value of second number from the first" do
    command "rpn 6 3 -"
    its(:stdout) { is_expected.to eq("3.0\n") }
    its(:stdout) { is_expected.not_to eq("-3.0\n") }
  end

  context "multiplies two numbers together" do
    command "rpn 5 5 '*'"
    its(:stdout) { is_expected.to eq("25.0\n") }
  end

  context "divides the value of second number into the first" do
    command "rpn 6 3 /"
    its(:stdout) { is_expected.to eq("2.0\n") }
    its(:stdout) { is_expected.not_to eq("0.5\n") }
  end

  context "can handle multiple computation operations" do
    command "rpn 250 5 5 5 '*' '*' /"
    its(:stdout) { is_expected.to eq("2.0\n") }
  end

  context "whitespace is ignored" do
    command "rpn 5   5       '*'"
    its(:stdout) { is_expected.to eq("25.0\n") }
  end

  context "can handle single value inputs" do
    command "rpn 5"
    its(:stdout) { is_expected.to eq("5.0\n") }
  end

  context "raises InsufficientOperandsError exception" do
    command "rpn 2 +"
    its(:stdout) { is_expected.to eq("Not enough operands. Try again.\n") }
  end

  context "raises UnrecognizedInputError exception" do
    command "rpn 2 +6.5 +"
    its(:stdout) { is_expected.to eq("The computation has an unrecognized input. Try again.\n") }
  end

  context "raises DivisionByZeroError exception" do
    command "rpn 2 0 /"
    its(:stdout) { is_expected.to eq("Dividing by zero gives you infinity. Try again.\n") }
  end

  context "raises ComputationIncompleteError exception" do
    command "rpn 2 2 2 -"
    its(:stdout) { is_expected.to eq("The computation was not fully specified. Try again.\n") }
  end
end
