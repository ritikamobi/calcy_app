# spec/string_calculator_spec.rb

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    #empty string
    it 'returns 0 for empty string' do
      expect(calculator.add('')).to eq(0)
    end
    #single input
    it 'returns the number for single input' do
      expect(calculator.add('4')).to eq(4)
    end
    #comma-separated
    it 'returns the sum for comma-separated numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end
    #string with delimiters
    it "handles new lines between numbers as delimiters" do
      expect(calculator.add("1\n2,3")).to eq(6)
      expect(calculator.add("4\n5\n6")).to eq(15)
    end
  end
end
