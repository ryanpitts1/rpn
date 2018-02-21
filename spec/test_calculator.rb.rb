require "spec_helper"

RSpec.describe Rpn do
  context "when testing the calculator" do
    it "sums the value of two numbers" do
      expect(Rpn::Calculator.compute('2 3 +')).to eq(5)
    end

    it "subtracts the value of second number from the first" do
      expect(Rpn::Calculator.compute('6 3 -')).to eq(3)
      expect(Rpn::Calculator.compute('6 3 -')).not_to eq(-3)
    end

    it "multiplies two numbers together" do
      expect(Rpn::Calculator.compute('5 5 *')).to eq(25)
    end

    it "divides the value of second number into the first" do
      expect(Rpn::Calculator.compute('6 3 /')).to eq(2)
      expect(Rpn::Calculator.compute('6 3 /')).not_to eq(0.5)
    end

    it "can handle multiple computation operations" do
      expect(Rpn::Calculator.compute('5 5 5 * *')).to eq(125)
      expect(Rpn::Calculator.compute('2 5 5 5 * * *')).to eq(125*2)
      expect(Rpn::Calculator.compute('250 5 5 5 * * /')).to eq(250/125)
    end

    it "whitespace is ignored" do
      expect(Rpn::Calculator.compute('5   5       *')).to eq(25)
    end

    it "can handle single value inputs" do
      expect(Rpn::Calculator.compute('6')).to eq(6)
      expect(Rpn::Calculator.compute('-6')).to eq(-6)
    end
  end
end
