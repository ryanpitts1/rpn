require 'spec_helper'

RSpec.describe Rpn do
  context 'when testing error handling' do
    it 'raises InsufficientOperandsError exception' do
      expect { Rpn::Calculator.compute('2 +') }.to raise_error(Rpn::InsufficientOperandsError)
    end

    it 'raises UnrecognizedInputError exception' do
      expect { Rpn::Calculator.compute('2 +6.5 +') }.to raise_error(Rpn::UnrecognizedInputError)
    end

    it 'raises DivisionByZeroError exception' do
      expect { Rpn::Calculator.compute('2 0 /') }.to raise_error(Rpn::DivisionByZeroError)
    end

    it 'raises ComputationIncompleteError exception' do
      expect { Rpn::Calculator.compute('2 2 2 -') }.to raise_error(Rpn::ComputationIncompleteError)
    end
  end
end
